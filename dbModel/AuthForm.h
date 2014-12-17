//---------------------------------------------------------------------------

#ifndef AuthFormH
#define AuthFormH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include "App.h"
class App;
//---------------------------------------------------------------------------
class TAuthForm : public TForm
{
__published:	// IDE-managed Components
	TLabel *Label1;
	TLabel *Label2;
	TEdit *Edit2;
	TEdit *Edit1;
	TButton *Button1;
	TCheckBox *CheckBox1;
	void __fastcall Edit1KeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TAuthForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
#endif
