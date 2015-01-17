//---------------------------------------------------------------------------

#ifndef RoomModalH
#define RoomModalH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include "ModalEntityForm.h"

#include <Vcl.ImgList.hpp>
#include <Vcl.ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TRoomModal : public TModalEntityForm
{
__published:	// IDE-managed Components
	TEdit *Edit1;
	TLabel *Label1;
	TLabel *Label3;
	TCheckBox *CheckBox1;
	TLabel *Label2;
	TCheckBox *CheckBox2;
	TEdit *Edit2;
	TLabel *Label4;
	TLabel *Label5;
	TButton *Button1;
	TListBox *ListBox1;
	TListBox *ListBox2;
	TButton *Button2;
	TImageList *ImageList1;
	TButton *Button3;
	TGridPanel *GridPanel1;
	TPanel *Panel1;
	void __fastcall Button2Click(TObject *Sender);
	void __fastcall Button3Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TRoomModal(TComponent* Owner);
	void writeToEntity(KAEntity *ent);
	void writeToForm(KAEntity *ent);
};
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
#endif
