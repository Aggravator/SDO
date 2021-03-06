//---------------------------------------------------------------------------

#ifndef SpecificsFormH
#define SpecificsFormH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Dialogs.hpp>
#include <Data.DB.hpp>
#include <Data.Win.ADODB.hpp>
#include <Vcl.DBGrids.hpp>
#include <Vcl.Grids.hpp>
#include <Vcl.ImgList.hpp>
#include <Vcl.Buttons.hpp>
#include <Vcl.Mask.hpp>
#include <vector>
#include "ComplexEntitiesForm.h"
#include "CoreData.h"
#include "App.h"
#include <algorithm>
#include "SpecificDialog.h"
#include "Unit2.h"
//---------------------------------------------------------------------------

class SpecificRows;
class TSpecificsForm : public TComplexEntitiesForm
{
__published:	// IDE-managed Components
	TButton *Button5;
	TButton *Button1;
	TScrollBox *ScrollBox1;
	TImageList *ImageList1;
	TGridPanel *GridPanel1;
	TLabel *Label2;
	void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
protected:
public:		// User declarations
	__fastcall TSpecificsForm(TComponent* Owner);
	__fastcall ~TSpecificsForm();
};

class SpecificRow:public AEntityRow{
public:
	TEdit *name;
	SpecificRow(ARowsPanel *parent,int size);
	void writeToRow(KAEntity* entity);
	void writeToEntity(KAEntity* entity);
	~SpecificRow();
};
class SpecificRows:public RRowsPanel<SpecificRow,3>{
public:
	__fastcall SpecificRows(TComponent *Owner);
	__fastcall ~SpecificRows();
};


//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
#endif
