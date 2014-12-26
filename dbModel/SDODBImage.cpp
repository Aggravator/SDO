//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#include <tchar.h>
#include "App.h"
//---------------------------------------------------------------------------
#include <Vcl.Styles.hpp>
#include <Vcl.Themes.hpp>


USEFORM("RoomsForm.cpp", Form7);
USEFORM("RoomModal.cpp", Form8);
USEFORM("TableForm.cpp", Form9);
USEFORM("Unit2.cpp", Form2);
USEFORM("SpecificsForm.cpp", Form3);
USEFORM("SpecificDialog.cpp", Form4);
USEFORM("CourseCreateForm.cpp", Form10);
USEFORM("AuthForm.cpp", Form1);
USEFORM("GroupModal.cpp", Form6);
USEFORM("GroupsForm.cpp", Form5);
USEFORM("ProgramModal.cpp", ProgramModal);
USEFORM("ProgramsForm.cpp", ProgramsForm);
//---------------------------------------------------------------------------
int WINAPI _tWinMain(HINSTANCE, HINSTANCE, LPTSTR, int)
{
	try
	{
		App::init();
		Application->Initialize();
		Application->MainFormOnTaskBar = true;
		TStyleManager::TrySetStyle("Amethyst Kamri");
		Application->CreateForm(__classid(TForm2), &Form2);
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
