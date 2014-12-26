//---------------------------------------------------------------------------

#ifndef TableFormH
#define TableFormH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Grids.hpp>
#include <Vcl.ImgList.hpp>
#include <algorithm>
#include <vector>
#include "CoreData.h"
#include "CourseCreateForm.h"
#include <set>
//using namespace std;
//---------------------------------------------------------------------------
class TCourseCreate;
struct ProgTables{
	Program *prog;
	std::pair<TDateTime,TDateTime> time;
	std::vector<Course*> plan;
	std::vector<Course*> real;
};
enum CellType{EUsual,EEmpty,ESpan,ECourseS,ECourseUS,EStaticS,EStaticUS};

class Cell{
public:
	Cell();
	void setSpan(int hs,int vs,String text,unsigned int flags=DT_CENTER|DT_WORDBREAK);
	void setCourseSpan(int hs);
	unsigned int flags;
	int hspan,vspan;
	String text;
	Course* courseR,*courseP;
	DateLesson *lessonR,*lessonP;
	CellType cellType;
};

class TTableForm : public TForm
{
__published:	// IDE-managed Components
	TGroupBox *GroupBox1;
	TCheckBox *CheckBox1;
	TCheckBox *CheckBox2;
	TStringGrid *StringGrid1;
	TPanel *Panel1;
	TPanel *Panel2;
	TPanel *Panel3;
	TImageList *ImageList1;
	TButton *Button2;
	TButton *Button3;
	TLabel *monthLabel;
	TGroupBox *GroupBox2;
	TCheckBox *CheckBox3;
	TLabel *Label1;
	TLabel *Label2;
	void __fastcall FormResize(TObject *Sender);
	void __fastcall StringGrid1DrawCell(TObject *Sender, int ACol, int ARow, TRect &Rect,
          TGridDrawState State);
	void __fastcall StringGrid1DblClick(TObject *Sender);
	void __fastcall StringGrid1SelectCell(TObject *Sender, int ACol, int ARow, bool &CanSelect);
	void __fastcall StringGrid1Click(TObject *Sender);
	void __fastcall CheckBox1Click(TObject *Sender);
	void __fastcall CheckBox2Click(TObject *Sender);
	void __fastcall Button3Click(TObject *Sender);
	void __fastcall Button2Click(TObject *Sender);
	void __fastcall CheckBox3Click(TObject *Sender);
	void __fastcall StringGrid1MouseDown(TObject *Sender, TMouseButton Button, TShiftState Shift,
          int X, int Y);
	void __fastcall StringGrid1DragOver(TObject *Sender, TObject *Source, int X, int Y,
          TDragState State, bool &Accept);
	void __fastcall StringGrid1DragDrop(TObject *Sender, TObject *Source, int X, int Y);
	void __fastcall StringGrid1MouseUp(TObject *Sender, TMouseButton Button, TShiftState Shift,
          int X, int Y);
	void __fastcall StringGrid1StartDrag(TObject *Sender, TDragObject *&DragObject);
	void __fastcall FormShow(TObject *Sender);





private:	// User declarations
public:		// User declarations
	TDate month;
	RealTable *realTable;
	PlanTable *planTable;
	std::vector<ProgTables*> progs;
	std::vector<std::vector<Cell*>*> cells;
	Cell *dragCell;
    std::vector<Cell*>* dragRow;
	void regenerateCells(std::vector<ProgTables*> &prgs);
	void clearCells();
	void clearProgs();
	void moveCourseFromTo(Course *course,std::vector<Cell*>* dragRow,Cell *from,Cell *to);
	void prTableToVector(ProgTables* pt,std::vector<Cell*>* row);
	struct FindPlanTByCourse{
	public:
		Course *course;
		bool operator()(ProgTables* ent) const
		{
			if(course->program==ent->prog){
				unsigned short hour1,hour2,min1,min2,sec,msec;
				course->start.DecodeTime(&hour1,&min1,&sec,&msec);
				ent->time.first.DecodeTime(&hour2,&min2,&sec,&msec);
				if(hour1==hour2 && min1==min2){
					course->end.DecodeTime(&hour1,&min1,&sec,&msec);
					ent->time.second.DecodeTime(&hour2,&min2,&sec,&msec);
					if(hour1==hour2 && min1==min2) return true;
				}
			}
			return false;
		}
	};
	struct FindPlanTByProgTime{
	public:
		Program *prog;
		std::pair<TDateTime,TDateTime>* time;
		bool operator()(ProgTables* ent) const
		{
			if(prog==ent->prog){
				unsigned short hour1,hour2,min1,min2,sec,msec;
				time->first.DecodeTime(&hour1,&min1,&sec,&msec);
				ent->time.first.DecodeTime(&hour2,&min2,&sec,&msec);
				if(hour1==hour2 && min1==min2){
					time->second.DecodeTime(&hour1,&min1,&sec,&msec);
					ent->time.second.DecodeTime(&hour2,&min2,&sec,&msec);
					if(hour1==hour2 && min1==min2) return true;
				}
			}
			return false;
		}
	};
	TColor  executedCourseColor;
	int itscc,itscr;
	Course *selectedCourse;
	bool showReal,showPlan;
	bool showAllPrograms;
	void sstringRedraw();
	ProgTables* getProgTableByRow(int row);
	TCourseCreate *ccf;
	void stringResizing();
	bool isIntoPeriod(KAEntity* ent);
	__fastcall TTableForm(TComponent* Owner);
	__fastcall ~TTableForm();
};
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
#endif
