//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#include <tchar.h>
#include "App.h"
//---------------------------------------------------------------------------
#include <Vcl.Styles.hpp>
#include <Vcl.Themes.hpp>

USEFORM("Unit2.cpp", Form2);
USEFORM("AuthForm.cpp", Form1);
USEFORM("SpecificsForm.cpp", Form3);
USEFORM("SpecificDialog.cpp", Form4);
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
int WINAPI _tWinMain(HINSTANCE, HINSTANCE, LPTSTR, int)
{
	try
	{
		App::init();
		Application->Initialize();
		Application->MainFormOnTaskBar = true;
		TStyleManager::TrySetStyle("Metropolis UI Blue");
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
