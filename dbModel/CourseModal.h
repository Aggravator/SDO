// ---------------------------------------------------------------------------

#ifndef CourseModalH
#define CourseModalH
// ---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include "ModalEntityForm.h"
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.ImgList.hpp>
#include "App.h"
#include <Vcl.ComCtrls.hpp>
#include <vector>
#include <algorithm>

// ---------------------------------------------------------------------------
class TCourseModal : public TModalEntityForm {
__published: // IDE-managed Components

	TLabel *Label1;
	TLabel *Label2;
	TComboBox *ComboBox2;
	TLabel *Label3;
	TEdit *Edit1;
	TLabel *Label4;
	TScrollBox *ScrollBox1;
	TGridPanel *GridPanel1;
	TLabel *Label5;
	TLabel *Label6;
	TGridPanel *dayPanel;
	TEdit *Edit2;
	TButton *Button1;
	TImageList *ImageList1;
	TButton *Button2;
	TPanel *Panel1;
	TPanel *Panel2;
	TLabel *Label7;
	TRichEdit *RichEdit1;
	TGridPanel *GridPanel2;
	void __fastcall Button2Click(TObject *Sender);

private: // User declarations
		public : // User declarations

	__fastcall TCourseModal(TComponent* Owner);
	virtual void writeToEntity(KAEntity *ent);
	virtual void writeToForm(KAEntity *ent);
	void initWithDL(std::vector<DateLesson*> &dates,Course *cr);
public:
	struct DateLessonRow{
		DateLessonRow(TCourseModal *pf){
			deleteButton=new TButton((HWND)0);
			deleteButton->Align=alClient;
			deleteButton->Images=pf->ImageList1;
			deleteButton->ImageIndex=1;
			deleteButton->OnClick=pf->deleteButtonClick;
			date=new TDateTimePicker((HWND)0);
			date->Align=alClient;
			//date->Font->Size=12;
			room=new TComboBox((HWND)0);
			room->Style=csDropDownList;
			room->Align=alClient;
			room->Font->Size=14;
		}
		TButton *deleteButton;
		TDateTimePicker *date;
		TComboBox *room;
	};
	int rowHeight;
	void __fastcall deleteButtonClick(TObject *Sender);
	std::vector<DateLessonRow*> dls;
	std::vector<DateLessonRow*> deletedls;
	std::vector<ClassRoom*> rooms;
	void clearSmena();
	void clearDLPanel();
};
// ---------------------------------------------------------------------------

// ---------------------------------------------------------------------------
#endif
