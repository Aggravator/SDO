//---------------------------------------------------------------------------

#ifndef GroupsFormH
#define GroupsFormH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ImgList.hpp>
#include "EntitiesForm.h"
#include "App.h"
#include "GroupModal.h"
#include <Vcl.ExtCtrls.hpp>
#include <algorithm>
#include <Vcl.ExtCtrls.hpp>
//---------------------------------------------------------------------------
class GroupRows;
class TGroupsForm : public TEntitiesForm
{
__published:	// IDE-managed Components
	TButton *Button5;
	TButton *Button1;
	TScrollBox *ScrollBox1;
	TImageList *ImageList1;
	TGridPanel *GridPanel1;
	TLabel *Label1;
	TLabel *Label2;
	void __fastcall FormShow(TObject *Sender);
	void __fastcall Button5Click(TObject *Sender);
	void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TGroupsForm(TComponent* Owner);
};

class GroupRow:public EntityRow{
public:
	TEdit *name;
	TCheckBox *isActive;
	GroupRow(GroupRows *parent);
	void writeToRow(KAEntity* entity);
	void writeToEntity(KAEntity* entity);
	~GroupRow();
};
class GroupRows:public RowsPanel{
public:
	EntityRow* addRow(KAEntity *entity=0);
	__fastcall GroupRows(TComponent *Owner);
	__fastcall ~GroupRows();
};
//---------------------------------------------------------------------------

//---------------------------------------------------------------------------
#endif
