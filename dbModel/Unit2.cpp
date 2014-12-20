//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit2.h"
#include "AuthForm.h"
//---------------------------------------------------------------------------
//#pragma package(smart_init)
#pragma resource "*.dfm"
TForm2 *Form2;
//---------------------------------------------------------------------------
__fastcall TForm2::TForm2(TComponent* Owner)
	: TForm(Owner)
{
	specsForm=0;
	TAuthForm *af=new TAuthForm(0);
	af->ShowModal();
	if(App::uid==0){
		delete af;
		Application->Terminate();
		return;
	}
	delete af;
	/*db=new SDODBImage(App::connection,App::uid);
	TDate month=EncodeDate(2012,11,01);
	db->getRealTable()->addMonth(month);
	db->refreshRealtable();*/
	//KAEntity *gr=db->getGroups()->at(0);
	//gr->deleteEntity();
}
//---------------------------------------------------------------------------
void __fastcall TForm2::Button1Click(TObject *Sender)
{
	//ADOConnection1->Execute("Insert into chat(message) values ('dfd');");
}
//---------------------------------------------------------------------------


void __fastcall TForm2::Button2Click(TObject *Sender)
{
	if(specsForm==0)specsForm=new TSpecificsForm(this);
	specsForm->ShowModal();
	delete specsForm;
	specsForm=0;
}
//---------------------------------------------------------------------------


void __fastcall TForm2::Button3Click(TObject *Sender)
{
	if(groupsForm==0)groupsForm=new TGroupsForm(this);
	groupsForm->ShowModal();
	delete groupsForm;
	groupsForm=0;
}
//---------------------------------------------------------------------------

