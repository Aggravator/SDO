//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "GroupModal.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"

//---------------------------------------------------------------------------
__fastcall TGroupModal::TGroupModal(TComponent* Owner)
	: TModalEntityForm(Owner)
{
	this->StringGrid1->Color=clRed;
	this->StringGrid1->Cells[0][0]="Год";
	this->StringGrid1->Cells[1][0]="План";
	emptyEntity=new Group("",true,0);
	entity=new Group("",true,0);
	tempEntity=new Group("",true,0);
	this->Button1->OnClick=FormOk;
	this->OnShow=FormShow;
}

void TGroupModal::writeToEntity(KAEntity *ent){
	Group *gr=dynamic_cast<Group*>(ent);
	gr->name=this->Edit1->Text;
	gr->isactual=this->CheckBox1->Checked;
	for(int i=0;i<gr->plan.size();++i)delete gr->plan[i];
	gr->plan.resize(this->StringGrid1->RowCount-2);
	for(int i=0;i<this->StringGrid1->RowCount-2;++i){
		std::pair<int,int> *yp=new std::pair<int,int>(StrToInt(StringGrid1->Cells[0][i+1]),StrToInt(StringGrid1->Cells[1][i+1]));
		gr->plan[i]=yp;
	}
}
void TGroupModal::writeToForm(KAEntity *ent){
	Group *gr=dynamic_cast<Group*>(ent);
	this->Edit1->Text=gr->name;
	this->CheckBox1->Checked=gr->isactual;
	this->StringGrid1->RowCount=gr->plan.size()+2;
	this->StringGrid1->Cells[0][gr->plan.size()+1]="";
	this->StringGrid1->Cells[1][gr->plan.size()+1]="";
	for(int i=0;i<gr->plan.size();++i){
		this->StringGrid1->Cells[0][i+1]=gr->plan[i]->first;
		this->StringGrid1->Cells[1][i+1]=gr->plan[i]->second;
	}
}
//---------------------------------------------------------------------------
void __fastcall TGroupModal::StringGrid1KeyUp(TObject *Sender, WORD &Key, TShiftState Shift)

{
	int row=this->StringGrid1->RowCount-1;
	if(this->StringGrid1->Cells[0][row]!="" || this->StringGrid1->Cells[1][row]!="")
		this->StringGrid1->RowCount+=1;
}
//---------------------------------------------------------------------------




