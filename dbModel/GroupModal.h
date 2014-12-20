//---------------------------------------------------------------------------

#ifndef GroupModalH
#define GroupModalH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include "ModalEntityForm.h"
#include <Vcl.Grids.hpp>
//---------------------------------------------------------------------------
class TGroupModal : public TModalEntityForm
{
__published:	// IDE-managed Components
	TStringGrid *StringGrid1;
private:	// User declarations
public:		// User declarations
	__fastcall TGroupModal(TComponent* Owner);
	void writeToEntity(KAEntity *ent);
	void writeToForm(KAEntity *ent);
};
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
#endif
