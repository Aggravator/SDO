//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "RoomsForm.h"
//---------------------------------------------------------------------------
//#pragma package(smart_init)
#pragma resource "*.dfm"
//---------------------------------------------------------------------------
__fastcall TRoomsForm::TRoomsForm(TComponent* Owner)
	: TEntitiesForm(Owner)
{
	this->modalForm=reinterpret_cast<TModalEntityForm **>(&App::ModalForms::roomModal);
	this->OnShow=FormShow;
	this->images=this->ImageList1;
	panel=new RoomRows(this);
	panel->Align=alTop;
	panel->Parent=this->ScrollBox1;
	panel->Height=0;
	panel->BevelOuter=bvNone;
	panel->Padding->Left=2;
	panel->Padding->Right=2;
	panel->Padding->Top=2;
	panel->Padding->Bottom=2;
}
//---------------------------------------------------------------------------

RoomRow::RoomRow(RoomRows *parent):EntityRow(parent){
	name=new TEdit((HWND)0);
	name->Font->Size=12;
	name->Align=alClient;
	capacity=new TEdit((HWND)0);
	capacity->Font->Size=12;
	capacity->Align=alClient;
	isActive=new TCheckBox((HWND)0);
	isActive->Width=20;
	isRent=new TCheckBox((HWND)0);
	isRent->Width=20;
	initEntity=new ClassRoom("",0,false,true,0);
	tempEntity=new ClassRoom("",0,false,true,0);
	parent->ControlCollection->AddControl(editButton);
	editButton->Parent=parent;
	editButton->OnClick=editBClick;
	parent->ControlCollection->AddControl(isActive);
	isActive->Parent=parent;
	parent->ControlCollection->AddControl(name);
	name->Parent=parent;
	parent->ControlCollection->AddControl(capacity);
	capacity->Parent=parent;
	parent->ControlCollection->AddControl(isRent);
	isRent->Parent=parent;
	parent->ControlCollection->AddControl(deleteButton);
	deleteButton->Parent=parent;
	deleteButton->OnClick=deleteBClick;
}
bool roomSort(KAEntity *a,KAEntity *b){
	ClassRoom *cr1=dynamic_cast<ClassRoom*>(a);
	ClassRoom *cr2=dynamic_cast<ClassRoom*>(b);
	if(cr1->isactual!=cr2->isactual){
		return cr1->isactual>cr2->isactual;
	}else return cr1->name<cr2->name;
}
void RoomRow::writeToRow(KAEntity* entity){
	ClassRoom *cr=dynamic_cast<ClassRoom*>(entity);
	name->Text=cr->name;
	isActive->Checked=cr->isactual;
	isRent->Checked=cr->isrent;
	capacity->Text=IntToStr(cr->capacity);
}
void RoomRow::writeToEntity(KAEntity* entity){
	ClassRoom *cr=dynamic_cast<ClassRoom*>(entity);
	cr->name=name->Text;
	cr->isactual=isActive->Checked;
	cr->isrent=isRent->Checked;
	cr->capacity=StrToInt(capacity->Text);
}
void __fastcall RoomRow::editBClick(TObject *Sender){
	onedit();
}
void __fastcall RoomRow::deleteBClick(TObject *Sender){
	parent->ControlCollection->BeginUpdate();
	parent->RowCollection->BeginUpdate();
	ondelete();
	parent->RowCollection->EndUpdate();
	parent->ControlCollection->EndUpdate();
}
RoomRow::~RoomRow(){
	delete name;
	delete capacity;
	delete isActive;
	delete isRent;
}

EntityRow* RoomRows::addRow(KAEntity *entity){
	RoomRow *cr=new RoomRow(this);
	cr->init(entity);
	TCellItem *ci=this->RowCollection->operator [](RowCollection->Count-1);
	ci->SizeStyle=ssAbsolute;
	ci->Value=rowHeight;
	this->Height+=rowHeight;
	rows.push_back(cr);
}

__fastcall RoomRows::RoomRows(TComponent *Owner):RowsPanel(Owner){
	entTable=App::db->getRooms();
	this->ColumnCollection->Clear();
	this->RowCollection->Clear();
	this->ColumnCollection->BeginUpdate();
	TColumnItem *ci=this->ColumnCollection->Add();
	ci->SizeStyle=ssAbsolute;
	ci->Value=35;
	ci=this->ColumnCollection->Add();
	ci->SizeStyle=ssAbsolute;
	ci->Value=50;
	ci=this->ColumnCollection->Add();
	ci->SizeStyle=ssPercent;
	ci->Value=100;
	ci=this->ColumnCollection->Add();
	ci->SizeStyle=ssAbsolute;
	ci->Value=55;
	ci=this->ColumnCollection->Add();
	ci->SizeStyle=ssAbsolute;
	ci->Value=50;
	ci=this->ColumnCollection->Add();
	ci->SizeStyle=ssAbsolute;
	ci->Value=35;
	this->ColumnCollection->EndUpdate();
}
__fastcall RoomRows::~RoomRows(){
}

void __fastcall TRoomsForm::FormShow(TObject *Sender)
{
	panel->clear();
	std::sort(panel->entTable->begin(),panel->entTable->end(),roomSort);
	for(int i=0;i<panel->entTable->size();++i){
		panel->addRow(panel->entTable->at(i));
	}
}
//---------------------------------------------------------------------------

void __fastcall TRoomsForm::Button5Click(TObject *Sender)
{
	this->Visible=false;
	panel->applyChanges();
	this->Close();
}
//---------------------------------------------------------------------------

void __fastcall TRoomsForm::Button2Click(TObject *Sender)
{
	ClassRoom *cr=new ClassRoom("",0,false,true,0);
	App::ModalForms::initForm(modalForm);
	int hy=modalForm[0]->ShowModal();
	if(hy==mrOk){
		*cr=*modalForm[0]->getEntity();
		panel->RowCollection->BeginUpdate();
		panel->ControlCollection->BeginUpdate();
		panel->addRow(cr);
		panel->ControlCollection->EndUpdate();
		panel->RowCollection->EndUpdate();
	}
}
//---------------------------------------------------------------------------

