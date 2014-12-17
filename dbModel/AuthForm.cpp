//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "AuthForm.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
//---------------------------------------------------------------------------
__fastcall TAuthForm::TAuthForm(TComponent* Owner): TForm(Owner)
{
	Edit1->Text=App::login;
	Edit2->Text=App::password;
}
void __fastcall TAuthForm::Edit1KeyPress(TObject *Sender, System::WideChar &Key)
{
	if(Key=='\r'){
		Button1Click(Button1);
		Key=0;
	}
}
//---------------------------------------------------------------------------

void __fastcall TAuthForm::Button1Click(TObject *Sender)
{
	if(CheckBox1->Checked==true){
		App::login=Edit1->Text;
		App::password=Edit2->Text;
		App::saveAuth();
	}
	if(Edit1->Text!="" && Edit2->Text!=""){
		String qstr=String().sprintf(L"select user_id from user where user_login='%s' and user_password='%s';",Edit1->Text,Edit2->Text);
		TADOQuery *query=new TADOQuery(0);
		query->Connection=App::connection;
		query->SQL->Add(qstr);
		query->Active=true;
		if(query->RecordCount>0){
			App::uid=query->operator []("user_id");
			App::updateCookie();
			App::initDbModel();
			this->Close();
		}else MessageBox(this->Handle,L"����� ��� ������ ������� �� ���������!",L"������",MB_OK);
		query->Close();
		delete query;
    } else 	MessageBox(this->Handle,L"����� � ������ ������ ��������� ��� ������ ���� ������!",L"������",MB_OK);
}
//---------------------------------------------------------------------------


