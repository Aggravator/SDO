//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#include <tchar.h>
#include "App.h"
//---------------------------------------------------------------------------
#include <Vcl.Styles.hpp>
#include <Vcl.Themes.hpp>
#include "DefaultReport.h"


USEFORM("ReportClass.cpp", Form14);
USEFORM("ReportFirst.cpp", Form11);
USEFORM("RoomModal.cpp", Form8);
USEFORM("ProgramModal.cpp", ProgramModal);
USEFORM("ProgramsForm.cpp", ProgramsForm);
USEFORM("RoomsForm.cpp", Form7);
USEFORM("SpecificsForm.cpp", Form3);
USEFORM("TableForm.cpp", Form9);
USEFORM("Unit2.cpp", Form2);
USEFORM("SpecificModal.cpp", Form13);
USEFORM("CourseCreateForm.cpp", Form10);
USEFORM("CourseModal.cpp", Form12);
USEFORM("AuthForm.cpp", Form1);
USEFORM("DefaultReport.cpp", Form4);
USEFORM("GroupModal.cpp", Form6);
USEFORM("GroupsForm.cpp", Form5);
//---------------------------------------------------------------------------
int WINAPI _tWinMain(HINSTANCE, HINSTANCE, LPTSTR str, int)
{
	try
	{
		if(App::init(str)>1) return 0;
		//2 - path to program directory error
		//3 - new update
		//4 - it is temp file
		Application->Initialize();
		Application->MainFormOnTaskBar = true;
		Application->Title = "sdo";
		TStyleManager::TrySetStyle("Amethyst Kamri");
		TStyleManager::Engine->RegisterStyleHook(__classid(TButtonColor), __classid(TMColorButton));
		Application->CreateForm(__classid(TForm2), &Form2);
		Application->MainForm->Show();
		Application->Run();
		App::destruct();
	}
	catch (Exception &exception)
	{
		Application->ShowException(&exception);
	}
	catch (...)
	{
		try
		{
			throw Exception("");
		}
		catch (Exception &exception)
		{
			Application->ShowException(&exception);
		}
	}
	return 0;
}
//---------------------------------------------------------------------------
