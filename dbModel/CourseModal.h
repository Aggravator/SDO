//---------------------------------------------------------------------------

#ifndef CourseModalH
#define CourseModalH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include "ModalEntityForm.h"
//---------------------------------------------------------------------------
class TCourseModal : public TModalEntityForm
{
__published:	// IDE-managed Components
	TLabel *Label1;
	TComboBox *ComboBox1;
	TLabel *Label2;
	TComboBox *ComboBox2;
	TLabel *Label3;
	TEdit *Edit1;
	TLabel *Label4;
	TScrollBox *ScrollBox1;
private:	// User declarations
public:		// User declarations
	__fastcall TCourseModal(TComponent* Owner);
	virtual void writeToEntity(KAEntity *ent);
	virtual void writeToForm(KAEntity *ent);
};
//---------------------------------------------------------------------------

//---------------------------------------------------------------------------
#endif
