//---------------------------------------------------------------------------

#ifndef ModalEntityFormH
#define ModalEntityFormH
#include <Vcl.Forms.hpp>
#include "CoreData.h"

class TModalEntityForm:public TForm{
protected:
	KAEntity *entity,*emptyEntity,*tempEntity;
	bool isApplied;
	virtual void __fastcall FormShow(TObject *Sender);
	virtual void __fastcall FormOk(TObject *Sender);
public:
	__fastcall TModalEntityForm(TComponent* Owner);
	__fastcall ~TModalEntityForm();
	bool applyEntity(const KAEntity *entity);
	virtual void writeToEntity(KAEntity *ent)=0;
	virtual void writeToForm(KAEntity *ent)=0;
	void onshow();
	const KAEntity* getEntity();
};
//---------------------------------------------------------------------------
#endif
