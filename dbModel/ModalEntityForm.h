//---------------------------------------------------------------------------

#ifndef ModalEntityFormH
#define ModalEntityFormH
#include <Vcl.Forms.hpp>
#include "CoreData.h"
class TModalEntityForm:public TForm{
private:
	KAEntity *entity,*emptyEntity;
	bool isApplied;
	virtual void __fastcall FormShow(TObject *Sender)=0;
	virtual void __fastcall FormOk(TObject *Sender);
	virtual void writeToEnt()=0;
public:
	__fastcall TModalEntityForm(TComponent* Owner);
	bool applyEntity(const KAEntity *entity);
	virtual void writeToEntity()=0;
	void onshow();
	const KAEntity* getEntity();

};
//---------------------------------------------------------------------------
#endif