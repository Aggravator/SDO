//---------------------------------------------------------------------------

#ifndef SpecificModalH
#define SpecificModalH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include "ModalEntityForm.h"
//---------------------------------------------------------------------------
class TSpecificModal : public TModalEntityForm
{
__published:	// IDE-managed Components
	TEdit *Edit1;
	TLabel *Label1;
	TButton *Button1;
private:	// User declarations
public:		// User declarations
	__fastcall TSpecificModal(TComponent* Owner);
	void writeToEntity(KAEntity *ent);
	void writeToForm(KAEntity *ent);
};
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
#endif
