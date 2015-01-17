//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "GroupsForm.h"
//---------------------------------------------------------------------------
//#pragma package(smart_init)
#pragma resource "*.dfm"

//---------------------------------------------------------------------------
__fastcall TGroupsForm::TGroupsForm(TComponent* Owner):TEntitiesForm(Owner)
{

	this->modalForm=reinterpret_cast<TModalEntityForm **>(&App::ModalForms::groupModal);
	this->images=this->ImageList1;
	panel=new GroupRows(this);
	panel->Align=alTop;
	panel->Parent=this->ScrollBox1;
	panel->Height=0;
	panel->BevelOuter=bvNone;
	panel->Padding->Left=2;
	panel->Padding->Right=2;
	panel->Padding->Top=2;
	panel->Padding->Bottom=2;
}
GroupRow::GroupRow(GroupRows *parent):EntityRow(parent){
	name=new TEdit((HWND)0);
	name->Font->Size=12;
	name->Align=alClient;
	isActive=new TCheckBox((HWND)0);
	isActive->Width=20;
	initEntity=new Group("",true,0);
	tempEntity=new Group("",true,0);
	parent->ControlCollection->AddControl(editButton);
	editButton->Parent=parent;
	editButton->OnClick=editBClick;
	parent->ControlCollection->AddControl(isActive);
	isActive->Parent=parent;
	parent->ControlCollection->AddControl(name);
	name->Parent=parent;
	parent->ControlCollection->AddControl(deleteButton);
	deleteButton->Parent=parent;
	deleteButton->OnClick=deleteBClick;
}
bool groupSort(KAEntity *a,KAEntity *b){
	Group *gp1=dynamic_cast<Group*>(a);
	Group *gp2=dynamic_cast<Group*>(b);
	if(gp1->isactual!=gp2->isactual){
		return gp1->isactual>gp2->isactual;
	}else return gp1->name<gp2->name;
}
void GroupRow::writeToRow(KAEntity* entity){
	Group *gr=dynamic_cast<Group*>(entity);
	name->Text=gr->name;
	isActive->Checked=gr->isactual;
}
void GroupRow::writeToEntity(KAEntity* entity){
	Group *gr=dynamic_cast<Group*>(entity);
	gr->name=name->Text;
	gr->isactual=isActive->Checked;
}
void __fastcall GroupRow::editBClick(TObject *Sender){
	onedit();
}
void __fastcall GroupRow::deleteBClick(TObject *Sender){
	ondelete();
}
GroupRow::~GroupRow(){
	delete name;
	delete isActive;
}

EntityRow* GroupRows::addRow(KAEntity *entity){
	GroupRow *gr=new GroupRow(this);
	gr->init(entity);
	TCellItem *ci=this->RowCollection->operator [](RowCollection->Count-1);
	ci->SizeStyle=ssAbsolute;
	ci->Value=rowHeight;
	this->Height+=rowHeight;
	rows.push_back(gr);
}

__fastcall GroupRows::GroupRows(TComponent *Owner):RowsPanel(Owner){
	entTable=App::db->getGroups();
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
	ci->Value=35;
	this->ColumnCollection->EndUpdate();
}
__fastcall GroupRows::~GroupRows(){
}

//---------------------------------------------------------------------------
void __fastcall TGroupsForm::FormShow(TObject *Sender)
{
	panel->clear();
	std::sort(panel->entTable->begin(),panel->entTable->end(),groupSort);
	for(int i=0;i<panel->entTable->size();++i){
		panel->addRow(panel->entTable->at(i));
	}
}
//---------------------------------------------------------------------------

void __fastcall TGroupsForm::Button5Click(TObject *Sender)
{
	this->Visible=false;
	panel->applyChanges();
	this->Close();
}
//---------------------------------------------------------------------------

void __fastcall TGroupsForm::Button1Click(TObject *Sender)
{
	Group *gr=new Group("",true,0);
	//if(this->modalForm[0]==0)this->modalForm[0]=new TGroupModal(0);
	//modalForm[0]->applyEntity(gr);
	App::ModalForms::initForm(modalForm);
	int hy=modalForm[0]->ShowModal();
	if(hy==mrOk){
		*gr=*modalForm[0]->getEntity();
		panel->addRow(gr);
	}
}
//---------------------------------------------------------------------------
