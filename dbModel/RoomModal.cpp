//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "RoomModal.h"
#include "App.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
//---------------------------------------------------------------------------
__fastcall TRoomModal::TRoomModal(TComponent* Owner)
	: TModalEntityForm(Owner)
{
	emptyEntity=new ClassRoom("",0,false,true,0);
	entity=new ClassRoom("",0,false,true,0);
	tempEntity=new ClassRoom("",0,false,true,0);
	this->Button1->OnClick=FormOk;
	this->OnShow=FormShow;
	ListBox1->Sorted=true;
	ListBox2->Sorted=true;
}
//---------------------------------------------------------------------------

bool specSort(KAEntity *a,KAEntity *b){
	Specific *sp1=dynamic_cast<Specific*>(a);
	Specific *sp2=dynamic_cast<Specific*>(b);
	return sp1->name<sp2->name;
}
void TRoomModal::writeToEntity(KAEntity *ent){
	ClassRoom *cr=dynamic_cast<ClassRoom*>(ent);
	cr->name=Edit1->Text;
	cr->capacity=StrToInt(Edit2->Text);
	cr->isactual=CheckBox1->Checked;
	cr->isrent=CheckBox2->Checked;
	cr->specifics.clear();
	for(int i=0;i<ListBox2->Count;++i){
		Specific *sp=reinterpret_cast<Specific*>(ListBox2->Items->Objects[i]);
		cr->specifics.push_back(reinterpret_cast<Specific*>(ListBox2->Items->Objects[i]));
    }
}

void TRoomModal::writeToForm(KAEntity *ent){
	ClassRoom *cr=dynamic_cast<ClassRoom*>(ent);
	Edit1->Text=cr->name;
	Edit2->Text=IntToStr(cr->capacity);
	CheckBox1->Checked=cr->isactual;
	CheckBox2->Checked=cr->isrent;
	Specifics *specifics=App::db->getSpecifics();
	std::sort(specifics->begin(), specifics->end());
	std::sort(cr->specifics.begin(), cr->specifics.end());
	std::vector<KAEntity*> lC(specifics->size());
	std::vector<KAEntity*>::iterator it= std::set_difference(specifics->begin(), specifics->end(),cr->specifics.begin(), cr->specifics.end(),lC.begin());
	lC.resize(it-lC.begin());
	//std::sort(lC.begin(),lC.end(),specSort);
	ListBox1->Clear();
	for(int i=0;i<lC.size();++i){
		this->ListBox1->AddItem(dynamic_cast<Specific*>(lC[i])->name,reinterpret_cast<TObject*>(lC[i]));
	}
	//std::sort(cr->specifics.begin(), cr->specifics.end(),specSort);
	ListBox2->Clear();
	for(int i=0;i<cr->specifics.size();++i){
		this->ListBox2->AddItem(cr->specifics[i]->name,reinterpret_cast<TObject*>(cr->specifics[i]));
	}
}


void __fastcall TRoomModal::Button2Click(TObject *Sender)
{
	for(int i=0;i<ListBox1->Count;++i){
		if(ListBox1->Selected[i]){
			ListBox2->AddItem(ListBox1->Items->operator [](i),ListBox1->Items->Objects[i]);
			ListBox1->Items->Delete(i);
			--i;
		}
	}
	//ListBox2->Sorted=true;
}
//---------------------------------------------------------------------------

void __fastcall TRoomModal::Button3Click(TObject *Sender)
{
	for(int i=0;i<ListBox2->Count;++i){
		if(ListBox2->Selected[i]){
			ListBox1->AddItem(ListBox2->Items->operator [](i),ListBox2->Items->Objects[i]);
			ListBox2->Items->Delete(i);
			--i;
		}
	}
}
//---------------------------------------------------------------------------

