//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "RoomsForm.h"
//---------------------------------------------------------------------------
//#pragma package(smart_init)
#pragma resource "*.dfm"
//---------------------------------------------------------------------------
__fastcall TRoomsForm::TRoomsForm(TComponent* Owner)
	: TComplexEntitiesForm(Owner)
{
	this->modalForm=reinterpret_cast<TModalEntityForm **>(&App::ModalForms::roomModal);
	this->OnShow=onShow;
	this->Button5->OnClick=this->onOkButton;
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
	std::vector<SDODBImage::EntityTypeEvent> events;
	SDODBImage::EntityTypeEvent ete;ete.entType=SDODBImage::EntityType::ERoom;ete.eventType=SDODBImage::EventType::Delete;
	events.push_back(ete);
	ete.entType=SDODBImage::EntityType::ERoom;ete.eventType=SDODBImage::EventType::Create;
	events.push_back(ete);
	ete.entType=SDODBImage::EntityType::ERoom;ete.eventType=SDODBImage::EventType::Update;
	events.push_back(ete);
	App::db->attachHandler(this,events);
}
__fastcall TRoomsForm::~TRoomsForm(){
	App::db->detachHandler(this);
}
//---------------------------------------------------------------------------

RoomRow::RoomRow(ARowsPanel *parent, int size):AEntityRow(parent,size){
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
	tempEntity=new ClassRoom("",0,false,true,0);
	controls[1]=isActive;
	controls[2]=name;
	controls[3]=capacity;
	controls[4]=isRent;
	this->deleteMessage="Внимание!\nУдаление класса приведет к удлению всех занятий, которые проходили в данном классе!\n";
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
RoomRow::~RoomRow(){
	delete name;
	delete capacity;
	delete isActive;
	delete isRent;
}

__fastcall RoomRows::RoomRows(TComponent *Owner):RRowsPanel<RoomRow,6>(Owner){
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

//---------------------------------------------------------------------------

void __fastcall TRoomsForm::Button2Click(TObject *Sender)
{
	ClassRoom *cr=new ClassRoom("",0,false,true,0);
	App::ModalForms::initForm(modalForm);
	int hy=modalForm[0]->ShowModal();
	if(hy==mrOk){
		*cr=*modalForm[0]->getEntity();
		panel->addRow(cr);
	}
}
//---------------------------------------------------------------------------

