//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "SpecificModal.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
//---------------------------------------------------------------------------
__fastcall TSpecificModal::TSpecificModal(TComponent* Owner)
	: TModalEntityForm(Owner)
{
	emptyEntity=new Specific("");
	entity=new Specific("");
	tempEntity=new Specific("");
	this->Button1->OnClick=FormOk;
	this->OnShow=FormShow;
}
//---------------------------------------------------------------------------
void TSpecificModal::writeToEntity(KAEntity *ent){
	Specific *sp=dynamic_cast<Specific*>(ent);
	sp->name=this->Edit1->Text;
}
void TSpecificModal::writeToForm(KAEntity *ent){
	Specific *sp=dynamic_cast<Specific*>(ent);
	this->Edit1->Text=sp->name;
}
