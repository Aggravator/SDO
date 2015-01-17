//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ProgramsForm.h"
//---------------------------------------------------------------------------
//#pragma package(smart_init)
#pragma resource "*.dfm"
//---------------------------------------------------------------------------
__fastcall TProgramsForm::TProgramsForm(TComponent* Owner)
	: TEntitiesForm(Owner)
{
	this->modalForm=reinterpret_cast<TModalEntityForm **>(&App::ModalForms::programModal);
	this->OnShow=FormShow;
	this->images=this->ImageList1;
	panel=new ProgramRows(this);
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

ProgramRow::ProgramRow(ProgramRows *parent):EntityRow(parent){
	name=new TEdit((HWND)0);
	name->Font->Size=12;
	name->Align=alClient;
	key=new TEdit((HWND)0);
	key->Font->Size=12;
	key->Align=alClient;
	isActive=new TCheckBox((HWND)0);
	isActive->Width=20;
	isTraining=new TCheckBox((HWND)0);
	isTraining->Width=20;
	initEntity=new Program("","",0,true,true,0,0,16777215,0,0,0,0);
	tempEntity=new Program("","",0,true,true,0,0,16777215,0,0,0,0);
	parent->ControlCollection->AddControl(editButton);
	editButton->Parent=parent;
	editButton->OnClick=editBClick;
	parent->ControlCollection->AddControl(isActive);
	isActive->Parent=parent;
	parent->ControlCollection->AddControl(name);
	name->Parent=parent;
	parent->ControlCollection->AddControl(key);
	isTraining->Parent=parent;
	parent->ControlCollection->AddControl(isTraining);
	isTraining->Parent=parent;
	parent->ControlCollection->AddControl(deleteButton);
	deleteButton->Parent=parent;
	deleteButton->OnClick=deleteBClick;
}
bool programSort(KAEntity *a,KAEntity *b){
	Program *cr1=dynamic_cast<Program*>(a);
	Program *cr2=dynamic_cast<Program*>(b);
	if(cr1->isactual!=cr2->isactual){
		return cr1->isactual>cr2->isactual;
	}else if(cr1->key!=cr2->key){
		return cr1->key<cr2->key;
    }else return cr1->name<cr2->name;
}
void ProgramRow::writeToRow(KAEntity* entity){
	Program *pr=dynamic_cast<Program*>(entity);
	name->Text=pr->name;
	isActive->Checked=pr->isactual;
	isTraining->Checked=pr->istraining;
	key->Text=pr->key;
}
void ProgramRow::writeToEntity(KAEntity* entity){
	Program *pr=dynamic_cast<Program*>(entity);
	pr->name=name->Text;
	pr->isactual=isActive->Checked;
	pr->istraining=isTraining->Checked;
	pr->key=key->Text;
}
void __fastcall ProgramRow::editBClick(TObject *Sender){
	onedit();
}
void __fastcall ProgramRow::deleteBClick(TObject *Sender){
	ondelete();
}
ProgramRow::~ProgramRow(){
	delete name;
	delete key;
	delete isActive;
	delete isTraining;
}

EntityRow* ProgramRows::addRow(KAEntity *entity){
	ProgramRow *cr=new ProgramRow(this);
	cr->init(entity);
	TCellItem *ci=this->RowCollection->operator [](RowCollection->Count-1);
	ci->SizeStyle=ssAbsolute;
	ci->Value=rowHeight;
	this->Height+=rowHeight;
	rows.push_back(cr);
}

__fastcall ProgramRows::ProgramRows(TComponent *Owner):RowsPanel(Owner){
	entTable=App::db->getPrograms();
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
	ci->Value=50;
	ci=this->ColumnCollection->Add();
	ci->SizeStyle=ssAbsolute;
	ci->Value=50;
	ci=this->ColumnCollection->Add();
	ci->SizeStyle=ssAbsolute;
	ci->Value=35;
	this->ColumnCollection->EndUpdate();
}
__fastcall ProgramRows::~ProgramRows(){
}

void __fastcall TProgramsForm::FormShow(TObject *Sender)
{
	panel->clear();
	std::sort(panel->entTable->begin(),panel->entTable->end(),programSort);
	for(int i=0;i<panel->entTable->size();++i){
		panel->addRow(panel->entTable->at(i));
	}
}
//---------------------------------------------------------------------------

void __fastcall TProgramsForm::Button5Click(TObject *Sender)
{
	this->Visible=false;
	panel->applyChanges();
	this->Close();
}
//---------------------------------------------------------------------------

void __fastcall TProgramsForm::Button2Click(TObject *Sender)
{
	Program *pr=new Program("","",0,true,true,0,0,16777215,0,0,0,0);
	App::ModalForms::initForm(modalForm);
	int hy=modalForm[0]->ShowModal();
	if(hy==mrOk){
		*pr=*modalForm[0]->getEntity();
		panel->addRow(pr);
	}
}
//---------------------------------------------------------------------------
