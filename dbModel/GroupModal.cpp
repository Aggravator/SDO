//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "GroupModal.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"

//---------------------------------------------------------------------------
__fastcall TGroupModal::TGroupModal(TComponent* Owner)
	: TModalEntityForm(Owner)
{
	this->StringGrid1->Color=clRed;
	emptyEntity=new Group("",true,0);
	entity=new Group("",true,0);
	tempEntity=new Group("",true,0);
}

void TGroupModal::writeToEntity(KAEntity *ent){
}
void TGroupModal::writeToForm(KAEntity *ent){
}
//---------------------------------------------------------------------------
