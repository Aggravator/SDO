//---------------------------------------------------------------------------

#pragma hdrstop

#include "ModalEntityForm.h"
__fastcall TModalEntityForm::TModalEntityForm(TComponent* Owner):TForm(Owner){
}
bool TModalEntityForm::applyEntity(const KAEntity *entity){
	*this->entity=*entity;
	this->isApplied=true;
}
const KAEntity* TModalEntityForm::getEntity(){
	return entity;
}
void TModalEntityForm::onshow(){
	if(!isApplied)*entity=*emptyEntity;
	isApplied=false;
}
void __fastcall TModalEntityForm::FormOk(TObject *Sender){
	writeToEnt();
	if(entity->validate())this->Close();
}
//---------------------------------------------------------------------------
#pragma package(smart_init)