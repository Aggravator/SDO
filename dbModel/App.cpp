//---------------------------------------------------------------------------

#pragma hdrstop
#include <stdio.h>
#include "App.h"
#include <windows.h>
#include <Shlobj.h>
TADOConnection * App::connection=0;
int App::uid=0;
String App::login="";
String App::password="";
wchar_t App::buffer[MAX_PATH];
int App::cookie=0;
SDODBImage *App::db=0;
void App::init(){
	bool result = SHGetSpecialFolderPath(0, buffer, CSIDL_LOCAL_APPDATA,false );
	if(result){
		String path=buffer;
		path+="//SDO//auth.ini";
		if(FileExists(path)){
			FILE *f=_wfopen(path.w_str(),L"r");
			buffer[0]='\0';
			buffer[20]='\0';
			fwscanf(f,L"%s\n%s",buffer,buffer+20);
			fclose(f);
			login=buffer;
			password=buffer+20;
		}
	}
	connection=new TADOConnection(0);
	connection->ConnectionString="Provider=MSDASQL.1;Password=root;Persist Security Info=True;User ID=root;Data Source=mysql;Initial Catalog=sdo";
	connection->LoginPrompt=false;
	connection->KeepConnection=true;
}
void App::initDbModel(){
	if(isConnectionActive() && uid!=0)db=new SDODBImage(connection,uid);
}
void App::destruct(){
	connection->Close();
	delete connection;
}
void App::saveAuth(){
	//if(login.Length()>0){
		bool result = SHGetSpecialFolderPath(0, buffer, CSIDL_LOCAL_APPDATA,false );
		if(result){
			String path=buffer;
			path+="\\SDO";
			if(!DirectoryExists(path))CreateDirectory(path.w_str(),NULL);
			path+="\\auth.ini";
			FILE *f=_wfopen(path.w_str(),L"w");
			fwprintf(f,L"%s\n%s",login.w_str(),password.w_str());
			fclose(f);
        }
    //}
}
void App::updateCookie(){
	if(uid!=0){
		cookie=rand();
		connection->Execute(String().sprintf(L"update user set user_cookie=%d where user_id=%d;",cookie,uid));
	}
}
bool App::isConnectionActive(){
	if(!connection->Connected){
		try{
            connection->Open();
		}
		catch(...){
			return false;
        }
	}else{
		bool result=true;
		TADOQuery *query=new TADOQuery(0);
		query->Connection=connection;
		query->SQL->Add(String().sprintf(L"select user_cookie from user where user_id=%d",uid));
		query->Active=true;
		if(query->RecordCount>0){
			if(cookie!=query->operator []("user_cookie")) result=false;
		}else result=false;
		query->Close();
		delete query;
		return result;
	}
	return true;
}
//---------------------------------------------------------------------------
#pragma package(smart_init)