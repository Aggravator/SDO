//---------------------------------------------------------------------------

#ifndef RoomsFormH
#define RoomsFormH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.ImgList.hpp>
#include "EntitiesForm.h"
#include "App.h"
#include "GroupModal.h"
#include <algorithm>
//---------------------------------------------------------------------------
class RoomRows;
class TRoomsForm : public TEntitiesForm
{
__published:	// IDE-managed Components
	TGridPanel *GridPanel1;
	TLabel *Label1;
	TLabel *Label2;
	TLabel *Label3;
	TLabel *Label4;
	TButton *Button5;
	TButton *Button2;
	TScrollBox *ScrollBox1;
	TImageList *ImageList1;
	void __fastcall Button5Click(TObject *Sender);
	void __fastcall Button2Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
	void __fastcall FormShow(TObject *Sender);
	__fastcall TRoomsForm(TComponent* Owner);
};
class RoomRow:public EntityRow{
public:
	TEdit *name,*capacity;
	TCheckBox *isActive,*isRent;
	RoomRow(RoomRows *parent);
	void __fastcall editBClick(TObject *Sender);
	void __fastcall deleteBClick(TObject *Sender);
	void writeToRow(KAEntity* entity);
	void writeToEntity(KAEntity* entity);
	~RoomRow();
};
class RoomRows:public RowsPanel{
public:
	EntityRow* addRow(KAEntity *entity=0);
	__fastcall RoomRows(TComponent *Owner);
	__fastcall ~RoomRows();
};
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
#endif
