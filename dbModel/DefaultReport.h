//---------------------------------------------------------------------------

#ifndef DefaultReportH
#define DefaultReportH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include "CoreData.h"
#include "App.h"
#include <ComObj.hpp>
#include <utilcls.h>
#include <vector>
#include <map>
//---------------------------------------------------------------------------



class TDefaultReport : public TForm
{
__published:	// IDE-managed Components
	TLabel *Label1;
	TLabel *Label2;
	TButton *Button1;
	TComboBox *ComboBox1;
	TEdit *Edit1;
	TComboBox *ComboBox2;
	TGroupBox *GroupBox1;
	TCheckBox *CheckBox1;
	TCheckBox *CheckBox2;
	void __fastcall Button1Click(TObject *Sender);
	void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations

	__fastcall TDefaultReport(TComponent* Owner);
protected:
	enum ExcelCellType{EXEmpty,EXSpan};
	enum ExcelHAlign{Left=-4131,Right=-4152,Center=-4108,Justify=-4130};
	enum ExcelVAlign{Top=-4160,Middle=-4108,Bottom=-4107};
	class ExcelCell{
	public:
		ExcelCell();
		Course *course;
		ExcelCellType type;
		int hspan,vspan;
		String text;
		unsigned int fillColor,borderColor;
		ExcelHAlign halign;
		ExcelVAlign valign;
		void setSpan(String text,int hspan=1,int vspan=1,ExcelHAlign halign=ExcelHAlign::Center,ExcelVAlign valign=ExcelVAlign::Middle,unsigned fillColor=16777215);
	private:
		void init(String text,ExcelCellType type,Course *course,int hspan,int vspan, ExcelHAlign halign,ExcelVAlign valign,unsigned fillColor,unsigned borderColor);
	};
	enum ExcelRowType{EHeader,EProgSmena,EGroup};
	class ExcelRow:public std::vector<ExcelCell*>{
	public:
		ExcelRow();
		ExcelRow(int length);
		~ExcelRow();
		ExcelRowType type;
		Program *prog;
		std::pair<TDateTime,TDateTime> smena;
		Group *group;
	};
	class ExcelPage{
	public:
		std::vector<ExcelRow*> rows;
		~ExcelPage();
	};

	class ProgSmena{
	public:
		Program *prog;
		std::pair<TDate,TDate> smena;
		operator <(const ProgSmena &ps)const;
		operator ==(ProgSmena &ps);
	};

	class ProgsForMonth{
	public:
		TDate month;
		std::map<ProgSmena,std::pair<std::vector<Course*>*,std::vector<Course*>*>*> planReal;
		~ProgsForMonth();
	};
    void excelPageToVariant(ExcelPage *page,Variant &var);
	void startEndToForm();
	void startEndFromForm();
	TDate start,end;
	std::vector<ProgsForMonth*> groupLayer;
	std::vector<ExcelPage*> excelLayer;
	void excelLayerToBook();
	void excelPageToSheet(ExcelPage *ep,Variant &sheet);
	void clearGroupLayer();
	void clearExcelLayer();
	bool showPlan,showReal;
};
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
#endif
