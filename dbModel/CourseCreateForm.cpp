//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "CourseCreateForm.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
//---------------------------------------------------------------------------
__fastcall TCourseCreate::TCourseCreate(TComponent* Owner,TTableForm *pp)
	: TForm(Owner)
{
	this->pp=pp;
	this->widthPlus=6;
	this->heightPlus=25;
}
//---------------------------------------------------------------------------
void __fastcall TCourseCreate::FormShow(TObject *Sender)
{
	if(isPlan==isReal){
		this->Panel1->SetBounds(0,0,Panel1->Width,Panel1->Height);
		this->Panel1->Visible=true;
		this->Width=Panel1->Width+widthPlus;
		this->Height=Panel1->Height+heightPlus;
	}
}
//---------------------------------------------------------------------------
bool sortP (KAEntity* ii,KAEntity* jj) {
	Program *i=dynamic_cast<Program*>(ii);
	Program *j=dynamic_cast<Program*>(jj);
	if(i->istraining!=j->istraining){
		return i->istraining>j->istraining;
	}else if(i->key!=j->key){
		return i->key<j->key;
	}else if(i->name!=j->name){
		return i->name<j->name;
	}
}
bool sortT (std::pair<TDateTime,TDateTime> * ii,std::pair<TDateTime,TDateTime> * jj) {
	return ii->first<jj->first;
}
bool sortR (KAEntity* ii,KAEntity* jj) {
	ClassRoom *i=dynamic_cast<ClassRoom *>(ii);
	ClassRoom *j=dynamic_cast<ClassRoom *>(jj);
	return i->name<j->name;
}
bool TCourseCreate::checkRoom(KAEntity* r){
	ClassRoom *room=(ClassRoom*)r;
	if(prog==NULL)return true;
	else{
		if(prog->specifics.size()>room->specifics.size())return false;
		else{
			for(int i=0;i<prog->specifics.size();++i){
				if(std::find(room->specifics.begin(),room->specifics.end(),prog->specifics[i])==room->specifics.end())
					return false;
			}
        }
	}
	return true;
}
bool TCourseCreate::checkProgram(KAEntity *p){
	Program *pr=(Program*)p;
	if(room==NULL)return true;
	else{
		if(pr->specifics.size()>room->specifics.size())return false;
		else{
			for(int i=0;i<pr->specifics.size();++i){
				if(std::find(room->specifics.begin(),room->specifics.end(),pr->specifics[i])==room->specifics.end())
					return false;
			}
		}
	}
	return true;
}
void TCourseCreate::showPrograms(){
	this->Panel2->SetBounds(0,0,Panel2->Width,Panel2->Height);
	this->Width=Panel2->Width+widthPlus;
	this->Height=Panel2->Height+heightPlus;
	ListBox1->Clear();
	Programs *prg=App::db->getPrograms();
	std::sort(prg->begin(),prg->end(),sortP);
	for(int i=0;i<prg->size();++i){
		if(checkProgram(prg->at(i))){
			Program *p=(Program*)prg->at(i);
			ListBox1->AddItem(p->key+" "+p->name,(TObject*)p);
		}
	}
	this->Panel2->Visible=true;
}
void TCourseCreate::showSmena(){
	this->Panel4->SetBounds(0,0,Panel4->Width,Panel4->Height);
	this->Width=Panel4->Width+widthPlus;
	this->Height=Panel4->Height+heightPlus;
	ListBox3->Clear();
	std::sort(prog->times.begin(),prog->times.end(),sortT);
	for(int i=0;i<prog->times.size();++i){
		ListBox3->AddItem(prog->times[i]->first.FormatString("hh:nn")+"-"+prog->times[i]->second.FormatString("hh:nn"),(TObject*)prog->times[i]);
	}
	this->Panel4->Visible=true;
}
void TCourseCreate::showRooms(){
	this->Panel3->SetBounds(0,0,Panel3->Width,Panel3->Height);
	this->Width=Panel3->Width+widthPlus;
	this->Height=Panel3->Height+heightPlus;
	ListBox2->Clear();
	Rooms *prg=App::db->getRooms();
	std::sort(prg->begin(),prg->end(),sortR);
	for(int i=0;i<prg->size();++i){
		if(checkRoom(prg->at(i))){
			ClassRoom *p=(ClassRoom*)prg->at(i);
			ListBox2->AddItem(p->name,(TObject*)p);
		}
	}
	this->Panel3->Visible=true;
}
void TCourseCreate::showStudents(){
	this->Panel5->SetBounds(0,0,Panel5->Width,Panel5->Height);
	this->Width=Panel5->Width+widthPlus;
	this->Height=Panel5->Height+heightPlus;
	this->Edit1->Text="";
	this->Panel5->Visible=true;
}
void __fastcall TCourseCreate::Button1Click(TObject *Sender)
{
	if(Sender==Button1){
		isPlan=true;
		isReal=false;
	}else{
		isPlan=false;
		isReal=true;
	}
	this->Panel1->Visible=false;
	if(prog==NULL){
		showPrograms();
	}else if(smena==NULL){
		showSmena();
	}else if(room==NULL){
		showRooms();
	}else if(studentsC<0){
		showStudents();
	}else{
        ModalResult = mrOk;
    }

}
//---------------------------------------------------------------------------



void __fastcall TCourseCreate::ListBox1DblClick(TObject *Sender)
{
	Panel2->Visible=false;
	for(int i=0;i<ListBox1->Count;++i){
		if(ListBox1->Selected[i]){
			prog=reinterpret_cast<Program*>(ListBox1->Items->Objects[i]);
			break;
		}
	}
	if(smena==NULL){
		showSmena();
	}else if(room==NULL){
		showRooms();
	}else if(studentsC<0){
		showStudents();
	}else{
		ModalResult = mrOk;
	}
}
//---------------------------------------------------------------------------

void __fastcall TCourseCreate::ListBox3DblClick(TObject *Sender)
{
	Panel4->Visible=false;
	for(int i=0;i<ListBox3->Count;++i){
		if(ListBox3->Selected[i]){
			smena=reinterpret_cast<std::pair<TDateTime,TDateTime> *>(ListBox3->Items->Objects[i]);
			break;
		}
	}
	if(room==NULL){
		showRooms();
	}else if(studentsC<0){
		showStudents();
	}else{
		ModalResult = mrOk;
	}
}
//---------------------------------------------------------------------------

void __fastcall TCourseCreate::ListBox2DblClick(TObject *Sender)
{
	Panel3->Visible=false;
	for(int i=0;i<ListBox2->Count;++i){
		if(ListBox2->Selected[i]){
			room=reinterpret_cast<ClassRoom*>(ListBox2->Items->Objects[i]);
			break;
		}
	}
	if(studentsC<0){
		showStudents();
	}else{
		ModalResult = mrOk;
	}
}
//---------------------------------------------------------------------------


void __fastcall TCourseCreate::Button3Click(TObject *Sender)
{
	Panel5->Visible=false;
	this->studentsC=StrToInt(Edit1->Text);
	ModalResult = mrOk;
}
//---------------------------------------------------------------------------

