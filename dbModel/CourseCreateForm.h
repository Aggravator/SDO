//---------------------------------------------------------------------------

#ifndef CourseCreateFormH
#define CourseCreateFormH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include "TableForm.h"
#include <Vcl.ExtCtrls.hpp>
#include "CoreData.h"
#include "App.h"
class TTableForm;
//---------------------------------------------------------------------------
class TCourseCreate : public TForm
{
__published:	// IDE-managed Components
	TButton *Button1;
	TButton *Button2;
	TPanel *Panel1;
	TPanel *Panel2;
	TListBox *ListBox1;
	TLabel *Label1;
	TPanel *Panel3;
	TLabel *Label2;
	TListBox *ListBox2;
	TPanel *Panel4;
	TLabel *Label3;
	TListBox *ListBox3;
	TPanel *Panel5;
	TLabel *Label4;
	TEdit *Edit1;
	TButton *Button3;
	void __fastcall FormShow(TObject *Sender);
	void __fastcall Button1Click(TObject *Sender);
	void __fastcall ListBox1DblClick(TObject *Sender);
	void __fastcall ListBox3DblClick(TObject *Sender);
	void __fastcall ListBox2DblClick(TObject *Sender);
	void __fastcall Button3Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TCourseCreate(TComponent* Owner,TTableForm *pp);
	bool checkRoom(KAEntity* r);
	bool checkProgram(KAEntity *p);
	void showPrograms();
	void showSmena();
	void showRooms();
	void showStudents();
	bool isPlan,isReal;
	int widthPlus,heightPlus;
	std::pair<TDateTime,TDateTime> *smena;
	Program *prog;
	ClassRoom *room;
	int studentsC;
	TTableForm *pp;
};
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
#endif
