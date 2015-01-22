//---------------------------------------------------------------------------

#ifndef ProgramModalH
#define ProgramModalH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include "ModalEntityForm.h"

#include <Vcl.ImgList.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Grids.hpp>
#include <Vcl.Dialogs.hpp>
#include <Vcl.Buttons.hpp>
#include <VCLTee.TeCanvas.hpp>
//---------------------------------------------------------------------------
class TMColorButton:public TButtonStyleHook{
protected:
	virtual void __fastcall Paint(TCanvas *Canvas);
	public:
	TButtonColor *sButtonColor;
	//__fastcall TMColorButton(TComponent* component);
};
class TProgramModal : public TModalEntityForm
{
__published:	// IDE-managed Components
	TEdit *Edit1;
	TLabel *Label1;
	TLabel *Label3;
	TCheckBox *CheckBox1;
	TLabel *Label5;
	TButton *Button1;
	TListBox *ListBox1;
	TListBox *ListBox2;
	TButton *Button2;
	TImageList *ImageList1;
	TButton *Button3;
	TGridPanel *GridPanel1;
	TPanel *Panel1;
	TLabel *Label2;
	TEdit *Edit3;
	TLabel *Label4;
	TCheckBox *CheckBox2;
	TStringGrid *StringGrid1;
	TLabel *Label6;
	TGridPanel *GridPanel2;
	TListBox *ListBox3;
	TPanel *Panel2;
	TButton *Button4;
	TButton *Button5;
	TListBox *ListBox4;
	TLabel *Label7;
	TLabel *Label8;
	TColorDialog *ColorDialog1;
	TStringGrid *StringGrid2;
	TLabel *Label9;
	TGridPanel *GridPanel3;
	TPanel *Panel3;
	TPanel *Panel4;
	TPanel *Panel5;
	TPanel *Panel6;
	TButtonColor *colorButton;
	TEdit *Edit2;
	TLabel *Label10;
	TLabel *Label11;
	TEdit *Edit4;
	void __fastcall Button2Click(TObject *Sender);
	void __fastcall StringGrid1KeyUp(TObject *Sender, WORD &Key, TShiftState Shift);
	void __fastcall Button3Click(TObject *Sender);
	void __fastcall Button4Click(TObject *Sender);
	void __fastcall Button5Click(TObject *Sender);
	void __fastcall colorButtonClick(TObject *Sender);
	void __fastcall StringGrid2KeyUp(TObject *Sender, WORD &Key, TShiftState Shift);
private:	// User declarations
public:		// User declarations
	__fastcall TProgramModal(TComponent* Owner);
	void writeToEntity(KAEntity *ent);
	void writeToForm(KAEntity *ent);
	//TMColorButton *colorButton;
};
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
#endif
