//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "SpecificsForm.h"
//---------------------------------------------------------------------------
//#pragma package(smart_init)
#pragma resource "*.dfm"
//---------------------------------------------------------------------------
__fastcall TSpecificsForm::TSpecificsForm(TComponent* Owner)
	: TForm(Owner)
{
	this->epa=0;
    //ColorBox1->Color
}
//-------------------------------------------------------------------------
bool specSort(KAEntity *a,KAEntity *b){
	Specific *sp1=dynamic_cast<Specific*>(a);
	Specific *sp2=dynamic_cast<Specific*>(b);
	return sp1->name<sp2->name;
}

void __fastcall TSpecificsForm::FormShow(TObject *Sender)
{
	std::sort(App::db->getSpecifics()->begin(),App::db->getSpecifics()->end(),specSort);
	if(epa!=0) delete epa;
	epa=new entsPA(this);
}
//---------------------------------------------------------------------------


void __fastcall TSpecificsForm::Button1Click(TObject *Sender)
{
	Specific *spec=new Specific("");
	TSpecificDialog *specDialog=dynamic_cast<TForm2*>(this->Owner)->specDialog;
	if(specDialog==0)specDialog=new TSpecificDialog(0,spec);
	else specDialog->specific=spec;
	specDialog->ShowModal();
	if(spec->validate()){
		//App::db->getSpecifics()->createEntity(spec);
		entsPA::specE *sp=new entsPA::specE(epa,this->GridPanel1,this->ImageList1,spec);
		//this->GridPanel1->Height+=35;
		epa->rows.push_back(sp);
	}else delete spec;
}
//---------------------------------------------------------------------------


void __fastcall TSpecificsForm::Button5Click(TObject *Sender)
{
	while(epa->deleteEnt.size()>0){
		if(App::db->getSpecifics()->isHas(epa->deleteEnt[0]->old))epa->deleteEnt[0]->old->deleteEntity();
		delete epa->deleteEnt[0]->old;
		delete epa->deleteEnt[0];
		epa->deleteEnt.erase(epa->deleteEnt.begin());
	}
	for(int i=0;i<epa->rows.size();++i){
		if(App::db->getSpecifics()->isHas(epa->rows[i]->old)){
			Specific *sp=new Specific(epa->rows[i]->name->Text);
			epa->rows[i]->old->updateEntity(sp);
			delete sp;
		}else App::db->getSpecifics()->createEntity(epa->rows[i]->old);
		delete epa->rows[i];
	}
	epa->rows.clear();
	this->Close();
}
//---------------------------------------------------------------------------

