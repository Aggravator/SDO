//---------------------------------------------------------------------------

#pragma hdrstop

#include "CoreData.h"

bool KAEntity::deleteEntity(){
	std::vector<KAEntity *> dell;
	dell.push_back(this);
	return parent->deleteEntities(dell);
}

Specific::Specific(int id,String* name,Specifics *parent){
	this->id=id;
	this->name=*name;
	this->parent=parent;
}

Specific::Specific(Specific &spec){
}

bool Specific::deleteSpecific(){
	std::vector<Specific*> sp;
	sp.push_back(this);
	parent->deleteSpecifics(st);
	return true;
}

Specifics::Specifics(SDODBImage *parent){
	this->parent=parent;
}

bool Specifics::createSpecific(String* name){
	String equ= "Insert into specificity(specificity_name,specificity_creator) values (";
	parent->connection->Execute(equ+*name+","+IntToStr(parent->getUID())+")");
	TADOQuery *query=new TADOQuery(0);
	query->SQL->Add("SELECT specificity_id FROM sdo.specificity order by specificity_createtime desc  limit 1;");
	query->Active=true;
	TADOQuery &squery=*query;
	Specific *spec=new Specific(squery["specificity_id"],name,this);
	this->push_back(spec);
	squery.Close();
	delete query;
	return true;
}
std::vector<Specific*>::iterator Specifics::erase(std::vector<Specific*>::iterator position){
	delete *position;
	std::vector<Specific*>::erase(position);
	return position;
}
bool Specifics::deleteSpecifics(std::vector<Specific*> &specifics){
	String queryStr="delete from specificity where specificity_id in (";
	for(int i=0;i<specifics.size();++i){
		queryStr+=specifics[i]->id+",";
		std::vector<Specific*>::iterator pos=std::find(this->begin(),this->end(),specifics[i]);
		this->erase(pos);
	}
	queryStr=queryStr.SubString(0,queryStr.Length()-1)+");";
	parent->connection->Execute("queryStr");
    return true;
}
//---------------------------------------------------------------------------
#pragma package(smart_init)