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
//#include "EntitiesForm.h"
#include "ComplexEntitiesForm.h"
#include "App.h"
#include "GroupModal.h"
#include <algorithm>
//---------------------------------------------------------------------------
class RoomRows;
class TRoomsForm : public TComplexEntitiesForm,public SDOHandler
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
	void __fastcall Button2Click(TObject *Sender);
private:	// User declarations
protected:
	void Handle(std::vector<EntEvent> &entities);
public:		// User declarations
	__fastcall TRoomsForm(TComponent* Owner);
	__fastcall ~TRoomsForm();
};
class RoomRow:public AEntityRow{
public:
	TEdit *name,*capacity;
	TCheckBox *isActive,*isRent;
	RoomRow(ARowsPanel *parent,int size);
	~RoomRow();
	void writeToRow(KAEntity* entity);
	void writeToEntity(KAEntity* entity);

};
class RoomRows:public RRowsPanel<RoomRow,6>{
public:
	__fastcall RoomRows(TComponent *Owner);
	__fastcall ~RoomRows();
};
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
#endif
