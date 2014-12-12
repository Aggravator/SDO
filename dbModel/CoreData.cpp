//---------------------------------------------------------------------------

#pragma hdrstop

#include "CoreData.h"

bool KAEntity::deleteEntity(){
	std::vector<KAEntity *> dell;
	dell.push_back(this);
	return parent->deleteEntities(dell);
}
bool KAEntity::updateEntity(KAEntity *entity){
	if(entity->validate()&& this->isDifferent(entity)){
		String query;
		this->updateQueryBuilder(query,entity);
		parent->parent->connection->Execute(query);
	}
}
int KAEntity::getID(){return id;}
void KAEntity::addOwner(KAEntity* entity){
	std::vector<KAEntity*>::iterator it=std::find(owners.begin(),owners.end(),entity);
	if(it==owners.end())owners.push_back(entity);
}
void KAEntity::removeOwner(KAEntity* entity){
	std::vector<KAEntity*>::iterator it=std::find(owners.begin(),owners.end(),entity);
	if(it!=owners.end())owners.erase(it);
}
void KAEntity::debind(){
	while(owners.size()>0){
		owners[0]->removeSlave(this);
		owners.erase(owners.begin());
	}
}
void KAEntity::debind(KAEntity* entity){
	std::vector<KAEntity*>::iterator it=std::find(owners.begin(),owners.end(),entity);
	(*it)->removeSlave(this);
	owners.erase(it);
}

bool KAEntityTable::deleteEntities(std::vector<KAEntity*> &entities){
	bool result=true;
	for(int i=0;i<entities.size()&&result;++i){
		result=this->isHas(entities[i]);
	}
	if(result==true){
		String query;
		this->deleteQueryBuilder(query,entities);
		TStringList *queries=new TStringList();
		queries->Delimiter='\n';
		queries->DelimitedText=query;
		for(int i=0;i<queries->Count;++i){
			parent->connection->Execute((*queries)[i]);
		}
		for(int i=0;i<entities.size();++i){
			for(int j=0;j<entities[i]->owners.size();++j){
				entities[i]->owners[j]->removeSlave(entities[i]);
			}
		}
		delete queries;
	}
}
KAEntity* KAEntityTable::getById(int id){
	KAEntity *result=0;
	for(int i=0;i<this->size() && result==0;++i)if(this->at(i)->id==id)result=this->at(i);
	return result;
}
bool KAEntityTable::createEntity(KAEntity* entity){
	std::vector<KAEntity*> entities;
	entities.push_back(entity);
	return this->createEntities(entities);
}
bool KAEntityTable::isHas(KAEntity* entity){
	if(find(this->begin(),this->end(),entity)!=this->end())return true;
	return false;
}
void KAEntityTable::debind(){
	for(int i=0;i<this->size();++i)this->at(i)->debind();
}

Specific::Specific(String name){
	this->name=name;
}
bool Specific::updateQueryBuilder(String &query,KAEntity *entity){
	Specific *ent=dynamic_cast<Specific*>(entity);
	name=ent->name;
	query=String().printf(L"update specificity set specificity_name='%s', specificity_updater=%d where specificity_id=%d",ent->name,parent->parent->getUID(),ent->id);
	return true;
}
bool Specific::validate()const{
	if(this->name.Length()>=1) return true;
	return false;
}
int Specific::isDifferent(KAEntity *entity)const{
	Specific *ent=dynamic_cast<Specific*>(entity);
	if(ent!=0 && ent->name!=this->name)return true;
	return false;
}
void Specific::removeSlave(KAEntity* entity){}

Specifics::Specifics(SDODBImage *parent){
	this->parent=parent;
}
bool Specifics::createEntities(std::vector<KAEntity*> &entities){
	bool result=true;
	for(int i=0;i<entities.size() && result;++i)result=!isHas(entities[i]) && entities[i]->validate();
	if(result){
		String query;
		this->createQueryBuilder(query,entities);
		TStringList *queries=new TStringList();
		queries->Delimiter='\n';
		queries->DelimitedText=query;
		for(int i=0;i<queries->Count;++i){
			parent->connection->Execute((*queries)[i]);
		}
		query=String().printf(L"SELECT specificity_id FROM sdo.specificity order by specificity_createtime desc  limit %d;",entities.size());
		TADOQuery &queryr=*(new TADOQuery(0));
		queryr.SQL->Add(query);
		queryr.Active=true;
		Specific *ent;
		for(int i=0;i<queryr.RecordCount;++i){
			ent=dynamic_cast<Specific*>(entities[entities.size()-1-i]);
			ent->id=queryr["specificity_id"];
			this->push_back(ent);
			queryr.Next();
		}
		delete &queryr;
		return true;
	}
	return false;
}
bool Specifics::deleteQueryBuilder(String& query,std::vector<KAEntity*> &entities){
	Specific *ent;
	query="delete from specificity where  specificity_id in (";
	String addString="insert into changes(changes_table,changes_user,changes_time,changes_rid,changes_action) values ";
	for(int i=0;i<entities.size();++i){
		ent=dynamic_cast<Specific*>(entities[i]);
		if(i!=entities.size()-1){
			query+=String().printf(L"%d,",ent->id);
			addString+=String().printf(L"('%s',%d,Now(),%d,'DELETE'),",L"specificity",parent->getUID(),ent->id);
		}
		else{
			query+=String().printf(L"%d);\n",ent->id);
			addString+=String().printf(L"('%s',%d,Now(),%d,'DELETE');",L"specificity",parent->getUID(),ent->id);
        }
	}
	query+=addString;
	return true;
}
bool Specifics::createQueryBuilder(String& query,std::vector<KAEntity*> &entities){
	Specific *ent;
	query="insert into specificity(specificity_name,creator) values ";
	for(int i=0;i<entities.size();++i){
		ent=dynamic_cast<Specific*>(entities[i]);
		if(i!=entities.size()-1) query+=String().printf(L"('%s',%d),",ent->name,parent->getUID());
		else query+=String().printf(L"('%s',%d);",ent->name,parent->getUID());
	}
	return true;
}

ClassRoom::ClassRoom(String name,int capacity,bool isrent,std::vector<Specific*> &specifics){
	this->name=name;
	this->capacity=capacity;
	this->isrent=isrent;
	this->specifics.assign(specifics.begin(),specifics.end());
}
bool ClassRoom::updateQueryBuilder(String &query,KAEntity *entity){
	ClassRoom *ent=dynamic_cast<ClassRoom*>(entity);
	int diff=this->isDifferent(entity);
	if(diff&1){
		query=String().printf(L"update class set class_name='%s', class_stcapacity=%d, class_isrent=%d, class_updater=%d where class_id=%d",ent->name, ent->capacity,ent->isrent,parent->parent->getUID(),ent->id);
		name=ent->name;
		isrent=ent->isrent;
		capacity=ent->capacity;
	}
	if(diff&2){
		std::sort(specifics.begin(), specifics.end());
		std::sort(ent->specifics.begin(), ent->specifics.end());
		std::vector<Specific*> remove(specifics.size());
		std::vector<Specific*>::iterator it= std::set_difference(specifics.begin(), specifics.end(),ent->specifics.begin(), ent->specifics.end(),remove.begin());
		remove.resize(it-remove.begin());
		std::vector<Specific*> add(ent->specifics.size());
		it=std::set_difference(ent->specifics.begin(), ent->specifics.end(), specifics.begin(), specifics.end(),add.begin());
		add.resize(it-add.begin());
		Specific *spec;
		if(remove.size()>0){
			if(diff&1)query+="\n";
			query+=String().printf(L"delete from specclass where class_id=%d and specificity_id in (",this->id);
			String addString="insert into changes(changes_table,changes_user,changes_time,changes_rid,changes_action) values ";
			for(int i=0;i<remove.size()-1;++i){
				spec=dynamic_cast<Specific*>(remove[i]);
				query+=String().printf(L"%d,",spec->getID());
				addString+=String().printf(L"('%s',%d,Now(),%d,'DELETE'),",L"specclass",parent->parent->getUID(),this->id);
				it=std::find(specifics.begin(),specifics.end(),remove[i]);
				specifics.erase(it);
			}
			spec=dynamic_cast<Specific*>(remove[remove.size()-1]);
			it=std::find(specifics.begin(),specifics.end(),remove[remove.size()-1]);
			specifics.erase(it);
			query+=String().printf(L"%d)\n",spec->getID());
			addString+=String().printf(L"('%s',%d,Now(),%d,'DELETE');",L"specclass",parent->parent->getUID(),this->id);
			query+=addString;
		}
		if(add.size()>0){
            if(diff&1 || remove.size()>0)query+="\n";
			query+="insert into specclass (class_id,specificity_id,creator) values ";
			for(int i=0;i<add.size()-1;++i){
				specifics.push_back(add[i]);
				spec=dynamic_cast<Specific*>(add[i]);
				query+=String().printf(L"(%d,%d,%d),",this->id,spec->getID(),parent->parent->getUID());
			}
			specifics.push_back(add[add.size()-1]);
			spec=dynamic_cast<Specific*>(add[add.size()-1]);
			query+=String().printf(L"(%d,%d,%d);",this->id,spec->getID(),parent->parent->getUID());
		}
	}
	return true;
}
bool ClassRoom::validate()const{
	bool result=true;
	if(this->name.Length()<1) result=false;
	KAEntityTable *specs=parent->parent->getSpecifics();
	for(int i=0;i<specifics.size() && result;++i)
		if(!specs->isHas(specifics[i]))result=false;
	return result;
}
int ClassRoom::isDifferent(KAEntity *entity)const{
	if(this==entity)return 0;
	ClassRoom *ent=dynamic_cast<ClassRoom*>(entity);
	if(ent==0)return 0;
	int result=0;
	if(name!=ent->name || capacity!=ent->capacity || isrent!=ent->isrent) result=result|1;
	if(specifics.size()!=ent->specifics.size())result=result|2;
	else{
		for(int i=0;i<specifics.size()&& !(result&2);++i){
			if(std::find(ent->specifics.begin(),ent->specifics.end(),specifics[i])==ent->specifics.end())
				result=result|2;
		}
	}
	return result;
}

Rooms::Rooms(SDODBImage *parent){
	this->parent=parent;
}
bool Rooms::createEntities(std::vector<KAEntity*> &entities){
	bool result=true;
	for(int i=0;i<entities.size() && result;++i)result=!isHas(entities[i]) && entities[i]->validate();
	if(result){
		String query;
		this->createQueryBuilder(query,entities);
		parent->connection->Execute(query);
		query=String().printf(L"SELECT class_id FROM class order by class_createtime desc  limit %d;",entities.size());
		TADOQuery &queryr=*(new TADOQuery(0));
		queryr.SQL->Add(query);
		queryr.Active=true;
		KAEntity *ent;
		for(int i=0;i<queryr.RecordCount;++i){
			ent=entities[entities.size()-1-i];
			ent->id=queryr["class_id"];
			this->push_back(ent);
			queryr.Next();
		}
		delete &queryr;
		if(this->createSubQueryBuilder(query,entities)){
			parent->connection->Execute(query);
		}
		return true;
	}
	return false;
}
bool Rooms::deleteQueryBuilder(String& query,std::vector<KAEntity*> &entities){
	ClassRoom *ent;
	query="delete from class where  class_id in (";
	String addString="insert into changes(changes_table,changes_user,changes_time,changes_rid,changes_action) values ";
	for(int i=0;i<entities.size();++i){
		ent=dynamic_cast<ClassRoom*>(entities[i]);
		if(i!=entities.size()-1){
			query+=String().printf(L"%d,",ent->id);
			addString+=String().printf(L"('%s',%d,Now(),%d,'DELETE'),",L"class",parent->getUID(),ent->id);
		}
		else{
			query+=String().printf(L"%d);\n",ent->id);
			addString+=String().printf(L"('%s',%d,Now(),%d,'DELETE');",L"class",parent->getUID(),ent->id);
        }
	}
	query+=addString;
	return true;
}
bool Rooms::createQueryBuilder(String& query,std::vector<KAEntity*> &entities){
	ClassRoom *ent;
	query="insert into class(class_name,class_stcapacity,class_isrent,creator) values ";
	for(int i=0;i<entities.size();++i){
		ent=dynamic_cast<ClassRoom*>(entities[i]);
		query+=String().printf(L"('%s',%d,%d,%d)",ent->name,ent->capacity,ent->isrent,parent->getUID());
		if(i!=entities.size()-1)query+=",";else query+=";";
	}
	return true;
}
bool Rooms::createSubQueryBuilder(String& query,std::vector<KAEntity*> &entities){
	query="insert into specclass(class_id,specificity_id,creator) values ";
	int qCS=query.Length();
	ClassRoom *ent;
	for(int i=0;i<entities.size();++i){
		ent=dynamic_cast<ClassRoom*>(entities[i]);
		for(int j=0;j<ent->specifics.size();++j)
			query+=String().printf(L"(%d,%d,%d),",ent->id,ent->specifics[i]->getID(),parent->getUID());
	}
	if(qCS<query.Length()){
		query=query.Delete(query.Length()-1,1)+";";
		return true;
	}
	return false;
}

bool isEqPlan(std::pair<int,int>* plan1,std::pair<int,int>* plan2){
	if(plan1->first==plan2->first){
		return plan1->second<plan2->second;
	}else return plan1->first<plan2->first;
}
Group::Group(String name,std::vector<std::pair<int,int>*> &plan){
	this->name=name;
	this->plan.resize(plan.size());
	for(int i=0;i<plan.size();++i)this->plan[i]=new std::pair<int,int>(*plan[i]);
}
bool Group::updateQueryBuilder(String &query,KAEntity *entity){
	Group *ent=dynamic_cast<Group*>(entity);
	int diff=this->isDifferent(entity);
	if(diff&1){
		query=String().printf(L"update group set group_name='%s', updater=%d where group_id=%d",ent->name,parent->parent->getUID(),ent->id);
	}
	if(diff&2){
		std::sort(plan.begin(), plan.end(),isEqPlan);
		std::sort(ent->plan.begin(), ent->plan.end(),isEqPlan);
		std::vector<std::pair<int,int>*> remove(plan.size());
		std::vector<std::pair<int,int>*>::iterator it= std::set_difference(plan.begin(), plan.end(),ent->plan.begin(), ent->plan.end(),remove.begin(),isEqPlan);
		remove.resize(it-remove.begin());
		std::vector<std::pair<int,int>*> add(ent->plan.size());
		it=std::set_difference(ent->plan.begin(), ent->plan.end(), plan.begin(), plan.end(),add.begin(),isEqPlan);
		add.resize(it-add.begin());
		std::pair<int,int>* yplan;
		if(remove.size()>0){
			if(diff&1)query+="\n";
			query+=String().printf(L"delete from groupplan where group_id=%d and groupplan_year in (",this->id);
			String addString="insert into changes(changes_table,changes_user,changes_time,changes_rid,changes_action) values ";
			for(int i=0;i<remove.size()-1;++i){
				yplan=dynamic_cast<std::pair<int,int>*>(remove[i]);
				query+=String().printf(L"%d,",yplan->first);
				addString+=String().printf(L"('%s',%d,Now(),%d,'DELETE'),",L"groupplan",parent->parent->getUID(),this->id);
				it=std::find(plan.begin(),plan.end(),remove[i]);
				delete *it;
				plan.erase(it);
			}
			yplan=dynamic_cast<std::pair<int,int>*>(remove[remove.size()-1]);
			query+=String().printf(L"%d)\n",yplan->first);
			addString+=String().printf(L"('%s',%d,Now(),%d,'DELETE');",L"groupplan",parent->parent->getUID(),this->id);
			query+=addString;
			it=std::find(plan.begin(),plan.end(),remove[remove.size()-1]);
			delete *it;
			plan.erase(it);
		}
		if(add.size()>0){
            if(diff&1 || remove.size()>0)query+="\n";
			query+="insert into groupplan (group_id, groupplan_year, groupplan_count,creator) values ";
			for(int i=0;i<add.size()-1;++i){
				yplan=dynamic_cast<std::pair<int,int>*>(add[i]);
				query+=String().printf(L"(%d,%d,%d,%d),",this->id,yplan->first,yplan->second,parent->parent->getUID());
				plan.push_back(new std::pair<int,int>(*add[i]));
			}
			yplan=dynamic_cast<std::pair<int,int>*>(add[add.size()-1]);
			query+=String().printf(L"(%d,%d,%d,%d);",this->id,yplan->first,yplan->second,parent->parent->getUID());
			plan.push_back(new std::pair<int,int>(*add[add.size()-1]));
		}
	}
	return true;
}
bool Group::validate()const{
	bool result=true;
	if(this->name.Length()<1) result=false;
	for(int i=0;i<plan.size() && result;++i)
		if(plan[i]->first>2000 && plan[i]->second>=0)result=false;
	return result;
}
int Group::isDifferent(KAEntity *entity)const{
	if(this==entity)return 0;
	Group *ent=dynamic_cast<Group*>(entity);
	if(ent==0)return 0;
	int result=0;
	if(name!=ent->name) result=result|1;
	if(plan.size()!=ent->plan.size())result=result|2;
	else{
		bool pres;
		for(int i=0;i<plan.size()&& !(result&2);++i){
			pres=true;
			for(int j=0;j<ent->plan.size() && pres;++j){
				if(i!=j){
					if(plan[i]->first==ent->plan[i]->first && plan[i]->second==ent->plan[i]->second)pres=false;
				}
			}
			if(!pres)result=result|2;
		}
	}
	return result;
}
Group::~Group(){
	for(int i=0;i<plan.size();++i) delete plan[i];
}

Groups::Groups(SDODBImage *parent){
	this->parent=parent;
}
bool Groups::createEntities(std::vector<KAEntity*> &entities){
	bool result=true;
	for(int i=0;i<entities.size() && result;++i)result=!isHas(entities[i]) && entities[i]->validate();
	if(result){
		String query;
		this->createQueryBuilder(query,entities);
		parent->connection->Execute(query);
		query=String().printf(L"SELECT group_id FROM group order by group_createtime desc  limit %d;",entities.size());
		TADOQuery &queryr=*(new TADOQuery(0));
		queryr.SQL->Add(query);
		queryr.Active=true;
		KAEntity *ent;
		for(int i=0;i<queryr.RecordCount;++i){
			ent=entities[entities.size()-1-i];
			ent->id=queryr["group_id"];
			this->push_back(ent);
			queryr.Next();
		}
		delete &queryr;
		if(this->createSubQueryBuilder(query,entities)){
			parent->connection->Execute(query);
		}
		return true;
	}
	return false;
}
bool Groups::deleteQueryBuilder(String& query,std::vector<KAEntity*> &entities){
	Group *ent;
	query="delete from group where  group_id in (";
	String addString="insert into changes(changes_table,changes_user,changes_time,changes_rid,changes_action) values ";
	for(int i=0;i<entities.size();++i){
		ent=dynamic_cast<Group*>(entities[i]);
		if(i!=entities.size()-1){
			query+=String().printf(L"%d,",ent->id);
			addString+=String().printf(L"('%s',%d,Now(),%d,'DELETE'),",L"group",parent->getUID(),ent->id);
		}
		else{
			query+=String().printf(L"%d);\n",ent->id);
			addString+=String().printf(L"('%s',%d,Now(),%d,'DELETE');",L"group",parent->getUID(),ent->id);
        }
	}
	query+=addString;
	return true;
}
bool Groups::createQueryBuilder(String& query,std::vector<KAEntity*> &entities){
	Group *ent;
	query="insert into group(group_name,creator) values ";
	for(int i=0;i<entities.size();++i){
		ent=dynamic_cast<Group*>(entities[i]);
		query+=String().printf(L"('%s',%d)",ent->name,parent->getUID());
		if(i!=entities.size()-1)query+=",";else query+=";";
	}
	return true;
}
bool Groups::createSubQueryBuilder(String &query,std::vector<KAEntity*> &entities){
	query="insert into groupplan(group_id,groupplan_year, groupplan_count,creator) values ";
	int qCS=query.Length();
	Group *ent;
	for(int i=0;i<entities.size();++i){
		ent=dynamic_cast<Group*>(entities[i]);
		for(int j=0;j<ent->plan.size();++j){
			query+=String().printf(L"(%d,%d,%d,%d),",ent->getID(),ent->plan[j]->first,ent->plan[j]->second,parent->getUID());
		}
	}
	if(qCS<query.Length()){
		query=query.Delete(query.Length()-1,1)+";";
		return true;
	}
	return false;
}

bool isEqTime(std::pair<TDateTime,TDateTime>* plan1,std::pair<TDateTime,TDateTime>* plan2){
	if(plan1->first==plan2->first){
		return plan1->second<plan2->second;
	}else return plan1->first<plan2->first;
}
Program::Program(String name,String key,int capacity,bool istraining,bool isactual,std::vector<Specific*> &specifics,std::vector<std::pair<int,int>*> &plan,std::vector<Group*> &groups){
	this->name=name;
	this->key=key;
	this->capacity=capacity;
	this->istraining=istraining;
	this->isactual=isactual;
	this->plan.resize(plan.size());
	for(int i=0;i<plan.size();++i)this->plan[i]=new std::pair<int,int>(*plan[i]);
	this->specifics.assign(specifics.begin(),specifics.end());
	this->groups.assign(groups.begin(),groups.end());
}
bool Program::updateQueryBuilder(String &query,KAEntity *entity){
	Program *ent=dynamic_cast<Program*>(entity);
	int diff=this->isDifferent(entity);
	if(diff&1){
		query=String().printf(L"update program set program_name='%s',program_key='%s',program_istraining=%d,program_isactual=%d,program_stcapacity=%d, program_updater=%d where program_id=%d",ent->name,ent->key,ent->istraining,ent->isactual,ent->capacity,parent->parent->getUID(),ent->id);
	}
	if(diff&2){
		std::sort(plan.begin(), plan.end(),isEqPlan);
		std::sort(ent->plan.begin(), ent->plan.end(),isEqPlan);
		std::vector<std::pair<int,int>*> remove(plan.size());
		std::vector<std::pair<int,int>*>::iterator it= std::set_difference(plan.begin(), plan.end(),ent->plan.begin(), ent->plan.end(),remove.begin(),isEqPlan);
		remove.resize(it-remove.begin());
		std::vector<std::pair<int,int>*> add(ent->plan.size());
		it=std::set_difference(ent->plan.begin(), ent->plan.end(), plan.begin(), plan.end(),add.begin(),isEqPlan);
		add.resize(it-add.begin());
		std::pair<int,int>* yplan;
		if(remove.size()>0){
			if(diff&1)query+="\n";
			query+=String().printf(L"delete from programplan where program_id=%d and programplan_year in (",this->id);
			String addString="insert into changes(changes_table,changes_user,changes_time,changes_rid,changes_action) values ";
			for(int i=0;i<remove.size()-1;++i){
				yplan=dynamic_cast<std::pair<int,int>*>(remove[i]);
				query+=String().printf(L"%d,",yplan->first);
				addString+=String().printf(L"('%s',%d,Now(),%d,'DELETE'),",L"programplan",parent->parent->getUID(),this->id);
				it=std::find(plan.begin(),plan.end(),remove[i]);
				delete *it;
				plan.erase(it);
			}
			yplan=dynamic_cast<std::pair<int,int>*>(remove[remove.size()-1]);
			query+=String().printf(L"%d)\n",yplan->first);
			addString+=String().printf(L"('%s',%d,Now(),%d,'DELETE');",L"programplan",parent->parent->getUID(),this->id);
			query+=addString;
			it=std::find(plan.begin(),plan.end(),remove[remove.size()-1]);
			delete *it;
			plan.erase(it);
		}
		if(add.size()>0){
            if(diff&1 || remove.size()>0)query+="\n";
			query+="insert into programplan (program_id, prograamplan_year, programplan_count,creator) values ";
			for(int i=0;i<add.size()-1;++i){
				yplan=dynamic_cast<std::pair<int,int>*>(add[i]);
				query+=String().printf(L"(%d,%d,%d,%d),",this->id,yplan->first,yplan->second,parent->parent->getUID());
				plan.push_back(new std::pair<int,int>(*add[i]));
			}
			yplan=dynamic_cast<std::pair<int,int>*>(add[add.size()-1]);
			query+=String().printf(L"(%d,%d,%d,%d);",this->id,yplan->first,yplan->second,parent->parent->getUID());
			plan.push_back(new std::pair<int,int>(*add[add.size()-1]));
		}
	}
	if(diff&4){
		std::sort(specifics.begin(), specifics.end());
		std::sort(ent->specifics.begin(), ent->specifics.end());
		std::vector<Specific*> remove(specifics.size());
		std::vector<Specific*>::iterator it= std::set_difference(specifics.begin(), specifics.end(),ent->specifics.begin(), ent->specifics.end(),remove.begin());
		remove.resize(it-remove.begin());
		std::vector<Specific*> add(ent->specifics.size());
		it=std::set_difference(ent->specifics.begin(), ent->specifics.end(), specifics.begin(), specifics.end(),add.begin());
		add.resize(it-add.begin());
		Specific *spec;
		if(remove.size()>0){
			if(diff&1 || diff&2)query+="\n";
			query+=String().printf(L"delete from specclass where class_id=%d and specificity_id in (",this->id);
			String addString="insert into changes(changes_table,changes_user,changes_time,changes_rid,changes_action) values ";
			for(int i=0;i<remove.size()-1;++i){
				spec=dynamic_cast<Specific*>(remove[i]);
				query+=String().printf(L"%d,",spec->getID());
				addString+=String().printf(L"('%s',%d,Now(),%d,'DELETE'),",L"specclass",parent->parent->getUID(),this->id);
				it=std::find(specifics.begin(),specifics.end(),remove[i]);
				specifics.erase(it);
			}
			spec=dynamic_cast<Specific*>(remove[remove.size()-1]);
			it=std::find(specifics.begin(),specifics.end(),remove[remove.size()-1]);
			specifics.erase(it);
			query+=String().printf(L"%d)\n",spec->getID());
			addString+=String().printf(L"('%s',%d,Now(),%d,'DELETE');",L"specclass",parent->parent->getUID(),this->id);
			query+=addString;
		}
		if(add.size()>0){
			if(diff&1 || diff&2 || remove.size()>0)query+="\n";
			query+="insert into specprogram (program_id,specificity_id,creator) values ";
			for(int i=0;i<add.size()-1;++i){
				specifics.push_back(add[i]);
				spec=dynamic_cast<Specific*>(add[i]);
				query+=String().printf(L"(%d,%d,%d),",this->id,spec->getID(),parent->parent->getUID());
			}
			specifics.push_back(add[add.size()-1]);
			spec=dynamic_cast<Specific*>(add[add.size()-1]);
			query+=String().printf(L"(%d,%d,%d);",this->id,spec->getID(),parent->parent->getUID());
		}
	}
	if(diff&8){
		std::sort(groups.begin(), groups.end());
		std::sort(ent->groups.begin(), ent->groups.end());
		std::vector<Group*> remove(groups.size());
		std::vector<Group*>::iterator it= std::set_difference(groups.begin(), groups.end(),ent->groups.begin(), ent->groups.end(),remove.begin());
		remove.resize(it-remove.begin());
		std::vector<Group*> add(ent->groups.size());
		it=std::set_difference(ent->groups.begin(), ent->groups.end(), groups.begin(), groups.end(),add.begin());
		add.resize(it-add.begin());
		Group *grp;
		if(remove.size()>0){
			if(diff&1 || diff&2 || diff&4)query+="\n";
			query+=String().printf(L"delete from programgroups where program_id=%d and group_id in (",this->id);
			String addString="insert into changes(changes_table,changes_user,changes_time,changes_rid,changes_action) values ";
			for(int i=0;i<remove.size()-1;++i){
				grp=dynamic_cast<Group*>(remove[i]);
				query+=String().printf(L"%d,",grp->getID());
				addString+=String().printf(L"('%s',%d,Now(),%d,'DELETE'),",L"programgroups",parent->parent->getUID(),this->id);
				it=std::find(groups.begin(),groups.end(),remove[i]);
				groups.erase(it);
			}
			grp=dynamic_cast<Group*>(remove[remove.size()-1]);
			it=std::find(groups.begin(),groups.end(),remove[remove.size()-1]);
			groups.erase(it);
			query+=String().printf(L"%d)\n",grp->getID());
			addString+=String().printf(L"('%s',%d,Now(),%d,'DELETE');",L"specclass",parent->parent->getUID(),this->id);
			query+=addString;
		}
		if(add.size()>0){
			if(diff&1 || diff&2 || diff&4 || remove.size()>0)query+="\n";
			query+="insert into programgroups (program_id,group_id,creator) values ";
			for(int i=0;i<add.size()-1;++i){
				groups.push_back(add[i]);
				grp=dynamic_cast<Group*>(add[i]);
				query+=String().printf(L"(%d,%d,%d),",this->id,grp->getID(),parent->parent->getUID());
			}
			groups.push_back(add[add.size()-1]);
			grp=dynamic_cast<Group*>(add[add.size()-1]);
			query+=String().printf(L"(%d,%d,%d);",this->id,grp->getID(),parent->parent->getUID());
		}
	}
	if(diff&16){
		std::sort(times.begin(), times.end(),isEqTime);
		std::sort(ent->times.begin(), ent->times.end(),isEqTime);
		std::vector<std::pair<TDateTime,TDateTime>*> remove(times.size());
		std::vector<std::pair<TDateTime,TDateTime>*>::iterator it= std::set_difference(times.begin(), times.end(),ent->times.begin(), ent->times.end(),remove.begin(),isEqTime);
		remove.resize(it-remove.begin());
		std::vector<std::pair<TDateTime,TDateTime>*> add(ent->times.size());
		it=std::set_difference(ent->times.begin(), ent->times.end(), times.begin(), times.end(),add.begin(),isEqTime);
		add.resize(it-add.begin());
		std::pair<TDateTime,TDateTime>* time;
		if(remove.size()>0){
			if(diff&1 || diff&2 || diff&4 || diff&8)query+="\n";
			query+=String().printf(L"delete from programtime where program_id=%d and (",this->id);
			String addString="insert into changes(changes_table,changes_user,changes_time,changes_rid,changes_action) values ";
			for(int i=0;i<remove.size()-1;++i){
				time=dynamic_cast<std::pair<TDateTime,TDateTime>*>(remove[i]);
				query+=String().printf(L"(programtime_start='%s' and programtime_end='%s') or ",time->first.FormatString("hh:nn:00"),time->second.FormatString("hh:nn:00"));
				addString+=String().printf(L"('%s',%d,Now(),%d,'DELETE'),",L"programtime",parent->parent->getUID(),this->id);
				it=std::find(times.begin(),times.end(),remove[i]);
				delete *it;
				times.erase(it);
			}
			time=dynamic_cast<std::pair<TDateTime,TDateTime>*>(remove[remove.size()-1]);
			query+=String().printf(L"(programtime_start='%s' and programtime_end='%s'));\n",time->first.FormatString("hh:nn:00"),time->second.FormatString("hh:nn:00"));
			addString+=String().printf(L"('%s',%d,Now(),%d,'DELETE');",L"programtime",parent->parent->getUID(),this->id);
			query+=addString;
			it=std::find(times.begin(),times.end(),remove[remove.size()-1]);
			delete *it;
			times.erase(it);
		}
		if(add.size()>0){
            if(diff&1 || diff&2 || diff&4 || diff&8 || remove.size()>0)query+="\n";
			query+="insert into programtime (program_id, prograamtime_start, programtime_end,creator) values ";
			for(int i=0;i<add.size()-1;++i){
				time=dynamic_cast<std::pair<TDateTime,TDateTime>*>(add[i]);
				query+=String().printf(L"(%d,'%s','%s',%d),",this->id,time->first.FormatString("hh:nn:00"),time->second.FormatString("hh:nn:00"),parent->parent->getUID());
				times.push_back(new std::pair<TDateTime,TDateTime>(*add[i]));
			}
			time=dynamic_cast<std::pair<TDateTime,TDateTime>*>(add[add.size()-1]);
			query+=String().printf(L"(%d,'%s','%s',%d);",this->id,time->first.FormatString("hh:nn:00"),time->second.FormatString("hh:nn:00"),parent->parent->getUID());
			times.push_back(new std::pair<TDateTime,TDateTime>(*add[add.size()-1]));
		}
	}
	return true;
}
bool Program::validate()const{
	bool result=true;
	if(this->name.Length()<1) result=false;
	for(int i=0;i<plan.size() && result;++i)
		if(plan[i]->first>2000 && plan[i]->second>=0)result=false;
	for(int i=0;i<times.size() && result;++i)
		if(times[i]->first>times[i]->second)result=false;
	KAEntityTable *specs=parent->parent->getSpecifics();
	for(int i=0;i<specifics.size() && result;++i)
		if(!specs->isHas(specifics[i]))result=false;
	KAEntityTable *grps=parent->parent->getGroups();
	for(int i=0;i<groups.size() && result;++i)
		if(!grps->isHas(groups[i]))result=false;
	return result;
}
int Program::isDifferent(KAEntity *entity)const{
	if(this==entity)return 0;
	Program *ent=dynamic_cast<Program*>(entity);
	if(ent==0)return 0;
	int result=0;
	if(name!=ent->name || key!=ent->key || capacity!=ent->capacity || istraining!=ent->istraining || isactual!=ent->isactual) result=result|1;
	if(plan.size()!=ent->plan.size())result=result|2;
	else{
		std::vector<std::pair<int,int>*> remove(plan.size());
		std::vector<std::pair<int,int>*>::iterator it= std::set_difference(plan.begin(), plan.end(),ent->plan.begin(), ent->plan.end(),remove.begin(),isEqPlan);
////// CHECK ME ON THE PRACTICE
		if(it!=remove.begin())result=result|2;
	}
	if(specifics.size()!=ent->specifics.size())result=result|4;
	else{
		for(int i=0;i<specifics.size()&& !(result&4);++i){
			if(std::find(ent->specifics.begin(),ent->specifics.end(),specifics[i])==ent->specifics.end())
				result=result|4;
		}
	}
	if(groups.size()!=ent->groups.size())result=result|8;
	else{
		for(int i=0;i<groups.size()&& !(result&8);++i){
			if(std::find(ent->groups.begin(),ent->groups.end(),groups[i])==ent->groups.end())
				result=result|8;
		}
	}
	if(times.size()!=ent->times.size())result=result|16;
	else{
		std::vector<std::pair<TDateTime,TDateTime>*> remove(times.size());
		std::vector<std::pair<TDateTime,TDateTime>*>::iterator it= std::set_difference(times.begin(), times.end(),ent->times.begin(), ent->times.end(),remove.begin(),isEqTime);
////// CHECK ME ON THE PRACTICE
		if(it!=remove.begin())result=result|16;
	}
	return result;
}
Program::~Program(){
	for(int i=0;i<plan.size();++i) delete plan[i];
	for(int i=0;i<times.size();++i)delete times[i];
}

Programs::Programs(SDODBImage *parent){
	this->parent=parent;
}
bool Programs::createEntities(std::vector<KAEntity*> &entities){
	bool result=true;
	for(int i=0;i<entities.size() && result;++i)result=!isHas(entities[i]) && entities[i]->validate();
	if(result){
		String query;
		this->createQueryBuilder(query,entities);
		parent->connection->Execute(query);
		query=String().printf(L"SELECT program_id FROM program order by program_createtime desc  limit %d;",entities.size());
		TADOQuery &queryr=*(new TADOQuery(0));
		queryr.SQL->Add(query);
		queryr.Active=true;
		KAEntity *ent;
		for(int i=0;i<queryr.RecordCount;++i){
			ent=entities[entities.size()-1-i];
			ent->id=queryr["program_id"];
			this->push_back(ent);
			queryr.Next();
		}
		delete &queryr;
		if(this->createSubQueryBuilder(query,entities)){
			TStringList *queries=new TStringList();
			queries->Delimiter='\n';
			queries->DelimitedText=query;
			for(int i=0;i<queries->Count;++i){
				parent->connection->Execute((*queries)[i]);
			}
		}
		return true;
	}
	return false;
}
bool Programs::deleteQueryBuilder(String& query,std::vector<KAEntity*> &entities){
	Group *ent;
	query="delete from program where  program_id in (";
	String addString="insert into changes(changes_table,changes_user,changes_time,changes_rid,changes_action) values ";
	for(int i=0;i<entities.size();++i){
		ent=dynamic_cast<Group*>(entities[i]);
		if(i!=entities.size()-1){
			query+=String().printf(L"%d,",ent->id);
			addString+=String().printf(L"('%s',%d,Now(),%d,'DELETE'),",L"program",parent->getUID(),ent->id);
		}
		else{
			query+=String().printf(L"%d);\n",ent->id);
			addString+=String().printf(L"('%s',%d,Now(),%d,'DELETE');",L"program",parent->getUID(),ent->id);
		}
	}
	query+=addString;
	return true;
}
bool Programs::createQueryBuilder(String& query,std::vector<KAEntity*> &entities){
	Program *ent;
	query="insert into program(program_name,program_key,program_istraining, program_isactual, program_stcapacity,creator) values ";
	for(int i=0;i<entities.size();++i){
		ent=dynamic_cast<Program*>(entities[i]);
		query+=String().printf(L"('%s','%s',%d,%d,%d,%d)",ent->name,ent->key,ent->istraining,ent->isactual,ent->capacity,parent->getUID());
		if(i!=entities.size()-1)query+=",";else query+=";";
	}
	return true;
}
bool Programs::createSubQueryBuilder(String &query,std::vector<KAEntity*> &entities){
	query="";
	String queryPlan="insert into programplan(program_id,programplan_year, programplan_count,creator) values ";
	String querySpecific="insert into specprogram(program_id,specificity_id,creator) values ";
	String queryGroups="insert into programgroups(program_id,group_id,creator) values ";
	Program *ent;
	for(int i=0;i<entities.size();++i){
		ent=dynamic_cast<Program*>(entities[i]);
		for(int j=0;j<ent->plan.size();++j){
			queryPlan+=String().printf(L"(%d,%d,%d,%d),",ent->getID(),ent->plan[j]->first,ent->plan[j]->second,parent->getUID());
		}
		for(int j=0;j<ent->specifics.size();++j){
			querySpecific+=String().printf(L"(%d,%d,%d),",ent->getID(),ent->specifics[j]->getID(),parent->getUID());
		}
		for(int j=0;j<ent->groups.size();++j){
			queryGroups+=String().printf(L"(%d,%d,%d),",ent->getID(),ent->groups[j]->getID(),parent->getUID());
		}
	}
	if(*queryPlan.LastChar()==L',')query+=queryPlan.SubString(0,queryPlan.Length()-1)+";\n";
	if(*querySpecific.LastChar()==L',')query+=querySpecific.SubString(0,querySpecific.Length()-1)+";\n";
	if(*queryGroups.LastChar()==L',')query+=queryGroups.SubString(0,queryGroups.Length()-1)+";\n";
	if(query.Length()>0)return true; else return false;
}

bool isEqLesson(DateLesson* l1,DateLesson* l2){
	if(l1->date== l2->date){
		return l1->room->getID()< l1->room->getID();
	}else return l1->date<l1->date;
}
Course::Course(Program* program,TDateTime start,TDateTime end,std::vector<DateLesson*> &dates,String desc){
	this->program=program;
	this->start=start;
	this->end=end;
	this->dates.resize(dates.size());
	for(int i=0;i<dates.size();++i)this->dates[i]=new DateLesson(*dates[i]);
	this->desc=desc;
}
bool Course::updateQueryBuilder(String &query,KAEntity *entity){
	Course *ent=dynamic_cast<Course*>(entity);
	int diff=this->isDifferent(entity);
	String tbn=dynamic_cast<CourseTable*>(parent)->tableName;
	if(diff&1){
		query=String().printf(L"update %s set program_id=%d,%s_timestart='%s',%s_timeend='%s',%s_desc='%s' updater=%d where %s_id=%d",tbn,ent->program->getID(),tbn,ent->start.FormatString("hh:nn"),tbn,ent->end.FormatString("hh:nn"),tbn,ent->desc,parent->parent->getUID(),tbn,ent->id);
	}
	if(diff&2){
		std::sort(dates.begin(), dates.end(),isEqLesson);
		std::sort(ent->dates.begin(), ent->dates.end(),isEqLesson);
		std::vector<DateLesson*> remove(dates.size());
		std::vector<DateLesson*>::iterator it= std::set_difference(dates.begin(), dates.end(),ent->dates.begin(), ent->dates.end(),remove.begin(),isEqLesson);
		remove.resize(it-remove.begin());
		std::vector<DateLesson*> add(ent->dates.size());
		it=std::set_difference(ent->dates.begin(), ent->dates.end(), dates.begin(), dates.end(),add.begin(),isEqLesson);
		add.resize(it-add.begin());
		DateLesson* dl;
		if(remove.size()>0){
			if(diff&1)query+="\n";
			query+=String().printf(L"delete from dates%s where %s_id=%d and dates%s_date in (",tbn,tbn,this->id,tbn);
			String addString="insert into changes(changes_table,changes_user,changes_time,changes_rid,changes_action) values ";
			for(int i=0;i<remove.size()-1;++i){
				dl=dynamic_cast<DateLesson*>(remove[i]);
				query+=String().printf(L"'%s',",dl->date.FormatString("yyyy-mm-dd"));
				addString+=String().printf(L"('%s',%d,Now(),%d,'DELETE'),",L"datesplantable",parent->parent->getUID(),this->id);
				it=std::find(dates.begin(),dates.end(),remove[i]);
				delete *it;
				dates.erase(it);
			}
			dl=dynamic_cast<DateLesson*>(remove[remove.size()-1]);
			query+=String().printf(L"'%s')\n",dl->date.FormatString("yyyy-mm-dd"));
			addString+=String().printf(L"('%s',%d,Now(),%d,'DELETE');",L"datesplantable",parent->parent->getUID(),this->id);
			query+=addString;
			it=std::find(dates.begin(),dates.end(),remove[remove.size()-1]);
			delete *it;
			dates.erase(it);
		}
		if(add.size()>0){
			if(diff&1 || remove.size()>0)query+="\n";
			query+=String().printf(L"insert into dates%s (%s_id, dates%s_date, dates%s_class,creator) values ",tbn,tbn,tbn,tbn);
			for(int i=0;i<add.size()-1;++i){
				dl=dynamic_cast<DateLesson*>(add[i]);
				query+=String().printf(L"(%d,%d,%d,%d),",this->id,dl->date.FormatString("yyyy-mm-dd"),dl->room->getID(),parent->parent->getUID());
				dates.push_back(new DateLesson(*add[i]));
			}
			dl=dynamic_cast<DateLesson*>(add[add.size()-1]);
			query+=String().printf(L"(%d,%d,%d,%d);",this->id,dl->date.FormatString("yyyy-mm-dd"),dl->room->getID(),parent->parent->getUID());
			dates.push_back(new DateLesson(*add[add.size()-1]));
		}
	}
	return true;
}
bool Course::validate()const{
	bool result=true;
	if((end-start).operator int()<0)result=false;
	Programs *progs=parent->parent->getPrograms();
	if(std::find(progs->begin(),progs->end(),program)==progs->end()) result=false;
	Rooms *rooms=parent->parent->getRooms();
	for(int i=0;i<dates.size() && result;++i)
		if(std::find(rooms->begin(),rooms->end(),dates[i]->room)==rooms->end())result=false;
	return result;
}
int Course::isDifferent(KAEntity *entity)const{
	if(this==entity)return 0;
	Course *ent=dynamic_cast<Course*>(entity);
	if(ent==0)return 0;
	int result=0;
	if(program!=ent->program || start!=ent->start || end!=ent->end || desc!=ent->desc)result=result|1;
	if(dates.size()!=ent->dates.size())result=result|2;
	else{
///CHECK ME ON THE PRACTICE
		std::vector<DateLesson*> diff(10);
		if(diff.begin()!=std::set_difference(ent->dates.begin(), ent->dates.end(), dates.begin(), dates.end(),diff.begin(),isEqLesson))result=result|2;
	}
	return result;
}
Course::~Course(){
	for(int i=0;i<dates.size();++i) delete dates[i];
}

CourseTable::CourseTable(SDODBImage *parent){
	this->parent=parent;
}
bool CourseTable::createEntities(std::vector<KAEntity*> &entities){
	bool result=true;
	for(int i=0;i<entities.size() && result;++i)result=!isHas(entities[i]) && entities[i]->validate();
	if(result){
		String query;
		this->createQueryBuilder(query,entities);
		parent->connection->Execute(query);
		query=String().printf(L"SELECT %s_id FROM %s order by %s_createtime desc  limit %d;",tableName,tableName,tableName,entities.size());
		TADOQuery &queryr=*(new TADOQuery(0));
		queryr.SQL->Add(query);
		queryr.Active=true;
		KAEntity *ent;
		String idcol=tableName+"_id";
		for(int i=0;i<queryr.RecordCount;++i){
			ent=entities[entities.size()-1-i];
			ent->id=queryr[idcol];
			this->push_back(ent);
			queryr.Next();
		}
		delete &queryr;
		if(this->createSubQueryBuilder(query,entities)){
			TStringList *queries=new TStringList();
			queries->Delimiter='\n';
			queries->DelimitedText=query;
			for(int i=0;i<queries->Count;++i){
				parent->connection->Execute((*queries)[i]);
			}
		}
		return true;
	}
	return false;
}
bool CourseTable::deleteQueryBuilder(String& query,std::vector<KAEntity*> &entities){
	Group *ent;
	query=String().printf(L"delete from %s where  %s_id in (",tableName,tableName);
	String addString="insert into changes(changes_table,changes_user,changes_time,changes_rid,changes_action) values ";
	for(int i=0;i<entities.size();++i){
		ent=dynamic_cast<Group*>(entities[i]);
		if(i!=entities.size()-1){
			query+=String().printf(L"%d,",ent->id);
			addString+=String().printf(L"('%s',%d,Now(),%d,'DELETE'),",tableName,parent->getUID(),ent->id);
		}
		else{
			query+=String().printf(L"%d);\n",ent->id);
			addString+=String().printf(L"('%s',%d,Now(),%d,'DELETE');",tableName,parent->getUID(),ent->id);
		}
	}
	query+=addString;
	return true;
}
bool CourseTable::createQueryBuilder(String& query,std::vector<KAEntity*> &entities){
	Course *ent;
	query=String().printf(L"insert into %s(%s_id,%s_timestart,%s_timeend, %s_desc,creator) values ",tableName,tableName,tableName,tableName,tableName);
	for(int i=0;i<entities.size();++i){
		ent=dynamic_cast<Course*>(entities[i]);
		query+=String().printf(L"(%d,'%s','%s','%s',%d)",ent->getID(),ent->start.FormatString("hh:nn"),ent->end.FormatString("hh:nn"),ent->desc,parent->getUID());
		if(i!=entities.size()-1)query+=",";else query+=";";
	}
	return true;
}
bool CourseTable::createSubQueryBuilder(String &query,std::vector<KAEntity*> &entities){
	query="insert into dates%s(%s_id,dates%s_date,dates%s_class,creator) values ";
	Course *ent;
	for(int i=0;i<entities.size();++i){
		ent=dynamic_cast<Course*>(entities[i]);
		for(int j=0;j<ent->dates.size();++j){
			query+=String().printf(L"(%d,'%s',%d,%d),",ent->getID(),ent->dates[j]->date.FormatString("yyyy-mm-dd"),ent->dates[j]->room->getID(),parent->getUID());
		}
	}
	if(*query.LastChar()==L','){
		query+=query.SubString(0,query.Length()-1)+";\n";
		return true;
	}
	return false;
}

PlanTable::PlanTable(SDODBImage *parent):CourseTable(parent){
	this->tableName="plantable";
}

RealTable::RealTable(SDODBImage *parent):CourseTable(parent){
	this->tableName="realtable";
}

SDODBImage::SDODBImage(TADOConnection *connection):programs(0),groups(0),rooms(0),specifics(0){
	this->connection=connection;
	this->timer=new TTimer(0);
	timer->OnTimer=checkUpdates;
	timer->Interval=10000;
	timer->Enabled=true;
	refreshSpecifics();
}
void SDODBImage::refreshSpecifics(){
	if(specifics!=0){
		specifics->debind();
		for(int i=0;i<specifics->size();++i)delete specifics->at(i);
		specifics->clear();
	}else specifics=new Specifics(this);
	TADOQuery &query=*(new TADOQuery(0));
	query.SQL->Add("select specificity_id,specificity_name from specificity;");
	query.Connection=this->connection;
	query.Active=true;
	Specific *spec;
	for(int i=0;i<query.RecordCount;++i){
		spec=new Specific(query["specificity_name"]);
		spec->id=query["specificity_id"];
		spec->parent=specifics;
		specifics->push_back(spec);
		query.Next();
	}
	delete &query;
}
void __fastcall SDODBImage::checkUpdates(TObject *Sender){

}
int SDODBImage::getUID(){
	return uid;
}
SDODBImage::~SDODBImage(){
	timer->Enabled=false;
	delete timer;
}

//---------------------------------------------------------------------------
#pragma package(smart_init)
