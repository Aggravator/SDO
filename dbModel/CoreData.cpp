//---------------------------------------------------------------------------

#pragma hdrstop

#include "CoreData.h"

bool KAEntity::deleteEntity(){
	if(parent!=0){
		std::vector<KAEntity *> dell;
		dell.push_back(this);
		return parent->deleteEntities(dell);
	}
	return false;
}
bool KAEntity::updateEntity(KAEntity *entity){
	if(entity->validate()&& this->isDifferent(entity)){
		String query;
		this->updateQueryBuilder(query,entity);
		parent->parent->connection->Execute(query);
		*this=*entity;
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
bool KAEntity::hasParent(){
	return parent!=0;
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
KAEntity::~KAEntity(){
	this->debind();
}
KAEntity::KAEntity():parent(0){
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
		queries->StrictDelimiter=true;
		queries->Delimiter='\n';
		queries->DelimitedText=query;
		for(int i=0;i<queries->Count;++i){
			String ht=(*queries)[i];
			parent->connection->Execute((*queries)[i]);
		}
		for(int i=0;i<entities.size();++i){
			entities[i]->debind();
			KAEntityTable::iterator it=std::find(this->begin(),this->end(),entities[i]);
			this->erase(it);
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
Specific::Specific(const Specific &specific){
	this->name=specific.name;
}
Specific& Specific::operator =(const KAEntity& entity){
	const Specific &specific=dynamic_cast<const Specific&>(entity);
	if(this!=&specific)this->name=specific.name;
	return *this;
}
bool Specific::updateQueryBuilder(String &query,KAEntity *entity){
	Specific *ent=dynamic_cast<Specific*>(entity);
	name=ent->name;
	query=String().sprintf(L"update specificity set specificity_name='%s', updater=%d where specificity_id=%d",ent->name,parent->parent->getUID(),this->id);
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
		queries->StrictDelimiter=true;
		queries->Delimiter='\n';
		queries->DelimitedText=query;
		for(int i=0;i<queries->Count;++i){
			parent->connection->Execute((*queries)[i]);
		}
		query=String().sprintf(L"SELECT specificity_id FROM sdo.specificity order by specificity_createtime desc  limit %d;",entities.size());
		TADOQuery &queryr=*(new TADOQuery(0));
		queryr.Connection=parent->connection;
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
			query+=String().sprintf(L"%d,",ent->id);
			addString+=String().sprintf(L"('%s',%d,Now(),%d,'DELETE'),",L"specificity",parent->getUID(),ent->id);
		}
		else{
			query+=String().sprintf(L"%d);\n",ent->id);
			addString+=String().sprintf(L"('%s',%d,Now(),%d,'DELETE');",L"specificity",parent->getUID(),ent->id);
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
		if(i!=entities.size()-1) query+=String().sprintf(L"('%s',%d),",ent->name,parent->getUID());
		else query+=String().sprintf(L"('%s',%d);",ent->name,parent->getUID());
	}
	return true;
}

ClassRoom::ClassRoom(String name,int capacity,bool isrent,std::vector<Specific*> *specifics){
	init(name,capacity,isrent,specifics);
}
ClassRoom::ClassRoom(const ClassRoom &classRoom){
	init(classRoom.name,classRoom.isrent,&classRoom.specifics);
}
void ClassRoom::init(String name,int capacity,bool isrent,std::vector<Specific*> *specifics){
	this->name=name;
	this->capacity=capacity;
	this->isrent=isrent;
	for(int i=0;i<this->specifics.size();++i)this->specifics[i]->removeOwner(this);
	this->specifics.clear();
	if(specifics!=0){
		this->specifics.assign(specifics->begin(),specifics->end());
		for(int i=0;i<specifics->size();++i)specifics->at(i)->addOwner(this);
	}
}
ClassRoom& ClassRoom::operator =(const KAEntity& entity){
	const ClassRoom& classRoom=dynamic_cast<const ClassRoom&>(entity);
	if(this!=&classRoom)init(classRoom.name,classRoom.isrent,&classRoom.specifics);
	return *this;
}
bool ClassRoom::updateQueryBuilder(String &query,KAEntity *entity){
	ClassRoom *ent=dynamic_cast<ClassRoom*>(entity);
	int diff=this->isDifferent(entity);
	if(diff&1){
		query=String().sprintf(L"update class set class_name='%s', class_stcapacity=%d, class_isrent=%d, updater=%d where class_id=%d",ent->name, ent->capacity,ent->isrent,parent->parent->getUID(),this->id);
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
			query+=String().sprintf(L"delete from specclass where class_id=%d and specificity_id in (",this->id);
			String addString="insert into changes(changes_table,changes_user,changes_time,changes_rid,changes_action) values ";
			for(int i=0;i<remove.size()-1;++i){
				spec=dynamic_cast<Specific*>(remove[i]);
				query+=String().sprintf(L"%d,",spec->getID());
				addString+=String().sprintf(L"('%s',%d,Now(),%d,'DELETE'),",L"specclass",parent->parent->getUID(),this->id);
				it=std::find(specifics.begin(),specifics.end(),remove[i]);
				specifics.erase(it);
			}
			spec=dynamic_cast<Specific*>(remove[remove.size()-1]);
			it=std::find(specifics.begin(),specifics.end(),remove[remove.size()-1]);
			specifics.erase(it);
			query+=String().sprintf(L"%d)\n",spec->getID());
			addString+=String().sprintf(L"('%s',%d,Now(),%d,'DELETE');",L"specclass",parent->parent->getUID(),this->id);
			query+=addString;
		}
		if(add.size()>0){
            if(diff&1 || remove.size()>0)query+="\n";
			query+="insert into specclass (class_id,specificity_id,creator) values ";
			for(int i=0;i<add.size()-1;++i){
				specifics.push_back(add[i]);
				spec=dynamic_cast<Specific*>(add[i]);
				query+=String().sprintf(L"(%d,%d,%d),",this->id,spec->getID(),parent->parent->getUID());
			}
			specifics.push_back(add[add.size()-1]);
			spec=dynamic_cast<Specific*>(add[add.size()-1]);
			query+=String().sprintf(L"(%d,%d,%d);",this->id,spec->getID(),parent->parent->getUID());
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
void ClassRoom::removeSlave(KAEntity* entity){
	if(dynamic_cast<Specific*>(entity)==0)return;
	for(int i=0;i<specifics.size();++i){
		if(specifics[i]->getID()==entity->getID()){
			specifics.erase(specifics.begin()+i);
			return;
		}
	}
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
		query=String().sprintf(L"SELECT class_id FROM class order by class_createtime desc  limit %d;",entities.size());
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
			query+=String().sprintf(L"%d,",ent->id);
			addString+=String().sprintf(L"('%s',%d,Now(),%d,'DELETE'),",L"class",parent->getUID(),ent->id);
		}
		else{
			query+=String().sprintf(L"%d);\n",ent->id);
			addString+=String().sprintf(L"('%s',%d,Now(),%d,'DELETE');",L"class",parent->getUID(),ent->id);
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
		query+=String().sprintf(L"('%s',%d,%d,%d)",ent->name,ent->capacity,ent->isrent,parent->getUID());
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
			query+=String().sprintf(L"(%d,%d,%d),",ent->id,ent->specifics[i]->getID(),parent->getUID());
	}
	if(qCS<query.Length()){
		query=query.Delete(query.Length(),1)+";";
		return true;
	}
	return false;
}

bool isEqPlan(std::pair<int,int>* plan1,std::pair<int,int>* plan2){
	if(plan1->first==plan2->first){
		return plan1->second<plan2->second;
	}else return plan1->first<plan2->first;
}
Group::Group(String name,bool isactual,std::vector<std::pair<int,int>*> *plan){
	init(name,isactual,plan);
}
Group::Group(const Group &group){
	init(group.name,group.isactual,&group.plan);
}
Group& Group::operator =(const KAEntity& entity){
	const Group& group=dynamic_cast<const Group&>(entity);
	if(this!=&group)init(group.name,group.isactual,&group.plan);
	return *this;
}
void Group::init(String name,bool isactual,const std::vector<std::pair<int,int>*> *plan){
	this->name=name;
	this->isactual=isactual;
	for(int i=0;i<this->plan.size();++i)delete this->plan[i];
	this->plan.clear();
	if(plan!=0){
		this->plan.resize(plan->size());
		for(int i=0;i<this->plan.size();++i)this->plan[i]=new std::pair<int,int>(*plan->at(i));
	}
}
bool Group::updateQueryBuilder(String &query,KAEntity *entity){
	Group *ent=dynamic_cast<Group*>(entity);
	int diff=this->isDifferent(entity);
	if(diff&1){
		query=String().sprintf(L"update sdo.group set group_name='%s', updater=%d where group_id=%d",ent->name,parent->parent->getUID(),this->id);
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
			query+=String().sprintf(L"delete from groupplan where group_id=%d and groupplan_year in (",this->id);
			String addString="insert into changes(changes_table,changes_user,changes_time,changes_rid,changes_action) values ";
			for(int i=0;i<remove.size()-1;++i){
				yplan=dynamic_cast<std::pair<int,int>*>(remove[i]);
				query+=String().sprintf(L"%d,",yplan->first);
				addString+=String().sprintf(L"('%s',%d,Now(),%d,'DELETE'),",L"groupplan",parent->parent->getUID(),this->id);
				it=std::find(plan.begin(),plan.end(),remove[i]);
				delete *it;
				plan.erase(it);
			}
			yplan=dynamic_cast<std::pair<int,int>*>(remove[remove.size()-1]);
			query+=String().sprintf(L"%d)\n",yplan->first);
			addString+=String().sprintf(L"('%s',%d,Now(),%d,'DELETE');",L"groupplan",parent->parent->getUID(),this->id);
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
				query+=String().sprintf(L"(%d,%d,%d,%d),",this->id,yplan->first,yplan->second,parent->parent->getUID());
				plan.push_back(new std::pair<int,int>(*add[i]));
			}
			yplan=dynamic_cast<std::pair<int,int>*>(add[add.size()-1]);
			query+=String().sprintf(L"(%d,%d,%d,%d);",this->id,yplan->first,yplan->second,parent->parent->getUID());
			plan.push_back(new std::pair<int,int>(*add[add.size()-1]));
		}
	}
	return true;
}
bool Group::validate()const{
	bool result=true;
	if(this->name.Length()<1) result=false;
	for(int i=0;i<plan.size() && result;++i)
		if(plan[i]->first<2000 || plan[i]->second<0)result=false;
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
void Group::removeSlave(KAEntity* entity){
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
		query=String().sprintf(L"SELECT group_id FROM sdo.group order by group_createtime desc  limit %d;",entities.size());
		TADOQuery &queryr=*(new TADOQuery(0));
		queryr.Connection=parent->connection;
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
	query="delete from sdo.group where  group_id in (";
	String addString="insert into changes(changes_table,changes_user,changes_time,changes_rid,changes_action) values ";
	for(int i=0;i<entities.size();++i){
		ent=dynamic_cast<Group*>(entities[i]);
		if(i!=entities.size()-1){
			query+=String().sprintf(L"%d,",ent->id);
			addString+=String().sprintf(L"('%s',%d,Now(),%d,'DELETE'),",L"group",parent->getUID(),ent->id);
		}
		else{
			query+=String().sprintf(L"%d);\n",ent->id);
			addString+=String().sprintf(L"('%s',%d,Now(),%d,'DELETE');",L"group",parent->getUID(),ent->id);
        }
	}
	query+=addString;
	return true;
}
bool Groups::createQueryBuilder(String& query,std::vector<KAEntity*> &entities){
	Group *ent;
	query="insert into sdo.group(group_name,creator) values ";
	for(int i=0;i<entities.size();++i){
		ent=dynamic_cast<Group*>(entities[i]);
		query+=String().sprintf(L"('%s',%d)",ent->name,parent->getUID());
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
			query+=String().sprintf(L"(%d,%d,%d,%d),",ent->getID(),ent->plan[j]->first,ent->plan[j]->second,parent->getUID());
		}
	}
	if(qCS<query.Length()){
		query=query.Delete(query.Length(),1)+";";
		return true;
	}
	return false;
}

bool isEqTime(std::pair<TDateTime,TDateTime>* plan1,std::pair<TDateTime,TDateTime>* plan2){
	if(plan1->first==plan2->first){
		return plan1->second<plan2->second;
	}else return plan1->first<plan2->first;
}
Program::Program(String name,String key,int capacity,bool istraining,bool isactual,unsigned color,std::vector<Specific*> *specifics,std::vector<std::pair<int,int>*> *plan,std::vector<Group*> *groups,std::vector<std::pair<TDateTime,TDateTime>*> *times){
	init(name,key,capacity,istraining,isactual,color,specifics,plan,groups,times);
}
Program::Program(const Program& program){
	init(program.name,program.key,program.capacity,program.istraining,program.isactual,program.color,&program.specifics,&program.plan,&program.groups,&program.times);
}
Program& Program::operator =(const KAEntity &entity){
	const Program& program=dynamic_cast<const Program&>(entity);
	if(this!=&program)init(program.name,program.key,program.capacity,program.istraining,program.isactual,program.color,&program.specifics,&program.plan,&program.groups,&program.times);
	return *this;
}
void Program::init(String name,String key,int capacity,bool istraining,bool isactual,unsigned color,const std::vector<Specific*> *specifics,const std::vector<std::pair<int,int>*> *plan,const std::vector<Group*> *groups,const std::vector<std::pair<TDateTime,TDateTime>*> *times){
	this->name=name;
	this->key=key;
	this->capacity=capacity;
	this->istraining=istraining;
	this->isactual=isactual;
	this->color=color;
	for(int i=0;i<this->plan.size();++i)delete this->plan[i];
	this->plan.clear();
	if(plan!=0){
		this->plan.resize(plan->size());
		for(int i=0;i<plan->size();++i)this->plan[i]=new std::pair<int,int>(*plan->at(i));
	}
	for(int i=0;i<this->specifics.size();++i)this->specifics[i]->removeOwner(this);
	if(specifics!=0){
		this->specifics.assign(specifics->begin(),specifics->end());
		for(int i=0;i<specifics->size();++i)specifics->at(i)->addOwner(this);
	}
	for(int i=0;i<this->groups.size();++i)this->groups[i]->removeOwner(this);
	if(groups!=0){
		this->groups.assign(groups->begin(),groups->end());
		for(int i=0;i<groups->size();++i)groups->at(i)->addOwner(this);
	}
	if(times!=0)this->times.assign(times->begin(),times->end());
}
bool Program::updateQueryBuilder(String &query,KAEntity *entity){
	Program *ent=dynamic_cast<Program*>(entity);
	int diff=this->isDifferent(entity);
	if(diff&1){
		query=String().sprintf(L"update program set program_name='%s',program_key='%s',program_istraining=%d,program_isactual=%d,program_stcapacity=%d,program_color=%d, updater=%d where program_id=%d",ent->name,ent->key,ent->istraining,ent->isactual,ent->capacity,ent->color,parent->parent->getUID(),this->id);
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
			query+=String().sprintf(L"delete from programplan where program_id=%d and programplan_year in (",this->id);
			String addString="insert into changes(changes_table,changes_user,changes_time,changes_rid,changes_action) values ";
			for(int i=0;i<remove.size()-1;++i){
				yplan=dynamic_cast<std::pair<int,int>*>(remove[i]);
				query+=String().sprintf(L"%d,",yplan->first);
				addString+=String().sprintf(L"('%s',%d,Now(),%d,'DELETE'),",L"programplan",parent->parent->getUID(),this->id);
				it=std::find(plan.begin(),plan.end(),remove[i]);
				delete *it;
				plan.erase(it);
			}
			yplan=dynamic_cast<std::pair<int,int>*>(remove[remove.size()-1]);
			query+=String().sprintf(L"%d)\n",yplan->first);
			addString+=String().sprintf(L"('%s',%d,Now(),%d,'DELETE');",L"programplan",parent->parent->getUID(),this->id);
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
				query+=String().sprintf(L"(%d,%d,%d,%d),",this->id,yplan->first,yplan->second,parent->parent->getUID());
				plan.push_back(new std::pair<int,int>(*add[i]));
			}
			yplan=dynamic_cast<std::pair<int,int>*>(add[add.size()-1]);
			query+=String().sprintf(L"(%d,%d,%d,%d);",this->id,yplan->first,yplan->second,parent->parent->getUID());
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
			query+=String().sprintf(L"delete from specclass where class_id=%d and specificity_id in (",this->id);
			String addString="insert into changes(changes_table,changes_user,changes_time,changes_rid,changes_action) values ";
			for(int i=0;i<remove.size()-1;++i){
				spec=dynamic_cast<Specific*>(remove[i]);
				query+=String().sprintf(L"%d,",spec->getID());
				addString+=String().sprintf(L"('%s',%d,Now(),%d,'DELETE'),",L"specclass",parent->parent->getUID(),this->id);
				it=std::find(specifics.begin(),specifics.end(),remove[i]);
				specifics.erase(it);
			}
			spec=dynamic_cast<Specific*>(remove[remove.size()-1]);
			it=std::find(specifics.begin(),specifics.end(),remove[remove.size()-1]);
			specifics.erase(it);
			query+=String().sprintf(L"%d)\n",spec->getID());
			addString+=String().sprintf(L"('%s',%d,Now(),%d,'DELETE');",L"specclass",parent->parent->getUID(),this->id);
			query+=addString;
		}
		if(add.size()>0){
			if(diff&1 || diff&2 || remove.size()>0)query+="\n";
			query+="insert into specprogram (program_id,specificity_id,creator) values ";
			for(int i=0;i<add.size()-1;++i){
				specifics.push_back(add[i]);
				spec=dynamic_cast<Specific*>(add[i]);
				query+=String().sprintf(L"(%d,%d,%d),",this->id,spec->getID(),parent->parent->getUID());
			}
			specifics.push_back(add[add.size()-1]);
			spec=dynamic_cast<Specific*>(add[add.size()-1]);
			query+=String().sprintf(L"(%d,%d,%d);",this->id,spec->getID(),parent->parent->getUID());
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
			query+=String().sprintf(L"delete from programgroups where program_id=%d and group_id in (",this->id);
			String addString="insert into changes(changes_table,changes_user,changes_time,changes_rid,changes_action) values ";
			for(int i=0;i<remove.size()-1;++i){
				grp=dynamic_cast<Group*>(remove[i]);
				query+=String().sprintf(L"%d,",grp->getID());
				addString+=String().sprintf(L"('%s',%d,Now(),%d,'DELETE'),",L"programgroups",parent->parent->getUID(),this->id);
				it=std::find(groups.begin(),groups.end(),remove[i]);
				groups.erase(it);
			}
			grp=dynamic_cast<Group*>(remove[remove.size()-1]);
			it=std::find(groups.begin(),groups.end(),remove[remove.size()-1]);
			groups.erase(it);
			query+=String().sprintf(L"%d)\n",grp->getID());
			addString+=String().sprintf(L"('%s',%d,Now(),%d,'DELETE');",L"specclass",parent->parent->getUID(),this->id);
			query+=addString;
		}
		if(add.size()>0){
			if(diff&1 || diff&2 || diff&4 || remove.size()>0)query+="\n";
			query+="insert into programgroups (program_id,group_id,creator) values ";
			for(int i=0;i<add.size()-1;++i){
				groups.push_back(add[i]);
				grp=dynamic_cast<Group*>(add[i]);
				query+=String().sprintf(L"(%d,%d,%d),",this->id,grp->getID(),parent->parent->getUID());
			}
			groups.push_back(add[add.size()-1]);
			grp=dynamic_cast<Group*>(add[add.size()-1]);
			query+=String().sprintf(L"(%d,%d,%d);",this->id,grp->getID(),parent->parent->getUID());
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
			query+=String().sprintf(L"delete from programtime where program_id=%d and (",this->id);
			String addString="insert into changes(changes_table,changes_user,changes_time,changes_rid,changes_action) values ";
			for(int i=0;i<remove.size()-1;++i){
				time=dynamic_cast<std::pair<TDateTime,TDateTime>*>(remove[i]);
				query+=String().sprintf(L"(programtime_start='%s' and programtime_end='%s') or ",time->first.FormatString("hh:nn:00"),time->second.FormatString("hh:nn:00"));
				addString+=String().sprintf(L"('%s',%d,Now(),%d,'DELETE'),",L"programtime",parent->parent->getUID(),this->id);
				it=std::find(times.begin(),times.end(),remove[i]);
				delete *it;
				times.erase(it);
			}
			time=dynamic_cast<std::pair<TDateTime,TDateTime>*>(remove[remove.size()-1]);
			query+=String().sprintf(L"(programtime_start='%s' and programtime_end='%s'));\n",time->first.FormatString("hh:nn:00"),time->second.FormatString("hh:nn:00"));
			addString+=String().sprintf(L"('%s',%d,Now(),%d,'DELETE');",L"programtime",parent->parent->getUID(),this->id);
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
				query+=String().sprintf(L"(%d,'%s','%s',%d),",this->id,time->first.FormatString("hh:nn:00"),time->second.FormatString("hh:nn:00"),parent->parent->getUID());
				times.push_back(new std::pair<TDateTime,TDateTime>(*add[i]));
			}
			time=dynamic_cast<std::pair<TDateTime,TDateTime>*>(add[add.size()-1]);
			query+=String().sprintf(L"(%d,'%s','%s',%d);",this->id,time->first.FormatString("hh:nn:00"),time->second.FormatString("hh:nn:00"),parent->parent->getUID());
			times.push_back(new std::pair<TDateTime,TDateTime>(*add[add.size()-1]));
		}
	}
	return true;
}
bool Program::validate()const{
	bool result=true;
	if(this->name.Length()<1) result=false;
	if(this->color>16777215) result=false;
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
	if(name!=ent->name || key!=ent->key || capacity!=ent->capacity || istraining!=ent->istraining || isactual!=ent->isactual || color!=ent->color) result=result|1;
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
void Program::removeSlave(KAEntity* entity){
	if(dynamic_cast<Specific*>(entity)==0){
		Specific* spec=dynamic_cast<Specific*>(entity);
		for(int i=0;i<this->specifics.size();++i){
			if(specifics[i]==spec){
				specifics.erase(specifics.begin()+i);
				return;
			}
		}
	}else if(dynamic_cast<Group*>(entity)==0){
		Group* group=dynamic_cast<Group*>(entity);
		for(int i=0;i<this->groups.size();++i){
			if(groups[i]==group){
				groups.erase(groups.begin()+i);
				return;
			}
		}
	}
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
		query=String().sprintf(L"SELECT program_id FROM program order by program_createtime desc  limit %d;",entities.size());
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
			queries->StrictDelimiter=true;
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
			query+=String().sprintf(L"%d,",ent->id);
			addString+=String().sprintf(L"('%s',%d,Now(),%d,'DELETE'),",L"program",parent->getUID(),ent->id);
		}
		else{
			query+=String().sprintf(L"%d);\n",ent->id);
			addString+=String().sprintf(L"('%s',%d,Now(),%d,'DELETE');",L"program",parent->getUID(),ent->id);
		}
	}
	query+=addString;
	return true;
}
bool Programs::createQueryBuilder(String& query,std::vector<KAEntity*> &entities){
	Program *ent;
	query="insert into program(program_name,program_key,program_istraining, program_isactual, program_stcapacity,program_color,creator) values ";
	for(int i=0;i<entities.size();++i){
		ent=dynamic_cast<Program*>(entities[i]);
		query+=String().sprintf(L"('%s','%s',%d,%d,%d,%d,%d)",ent->name,ent->key,ent->istraining,ent->isactual,ent->capacity,ent->color,parent->getUID());
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
			queryPlan+=String().sprintf(L"(%d,%d,%d,%d),",ent->getID(),ent->plan[j]->first,ent->plan[j]->second,parent->getUID());
		}
		for(int j=0;j<ent->specifics.size();++j){
			querySpecific+=String().sprintf(L"(%d,%d,%d),",ent->getID(),ent->specifics[j]->getID(),parent->getUID());
		}
		for(int j=0;j<ent->groups.size();++j){
			queryGroups+=String().sprintf(L"(%d,%d,%d),",ent->getID(),ent->groups[j]->getID(),parent->getUID());
		}
	}
	if(*queryPlan.LastChar()==L',')query+=queryPlan.SubString(0,queryPlan.Length())+";\n";
	if(*querySpecific.LastChar()==L',')query+=querySpecific.SubString(0,querySpecific.Length())+";\n";
	if(*queryGroups.LastChar()==L',')query+=queryGroups.SubString(0,queryGroups.Length())+";\n";
	if(query.Length()>0)return true; else return false;
}

bool isEqLesson(DateLesson* l1,DateLesson* l2){
	if(l1->date== l2->date){
		return l1->room->getID()< l1->room->getID();
	}else return l1->date<l1->date;
}
//Course::Course(){
//}
Course::Course(Program* program,TDateTime start,TDateTime end,std::vector<DateLesson*> *dates,String desc){
	init(program,start,end,dates,desc);
}
Course::Course(const Course &course){
	init(course.program,course.start,course.end,&course.dates,course.desc);
}
Course& Course::operator =(const KAEntity& entity){
	const Course& course=dynamic_cast<const Course&>(entity);
	if(this!=&course)init(course.program,course.start,course.end,&course.dates,course.desc);
	return *this;
}
void Course::init(Program* program,TDateTime start,TDateTime end,const std::vector<DateLesson*> *dates,String desc){
	this->program=program;
	program->addOwner(this);
	this->start=start;
	this->end=end;
	for(int i=0;i<this->dates.size();++i)delete this->dates[i];
	this->dates.clear();
	if(dates!=0){
		this->dates.resize(dates->size());
		for(int i=0;i<dates->size();++i)this->dates[i]=new DateLesson(*dates->at(i));
	}
	this->desc=desc;
}
bool Course::updateQueryBuilder(String &query,KAEntity *entity){
	Course *ent=dynamic_cast<Course*>(entity);
	int diff=this->isDifferent(entity);
	String tbn=dynamic_cast<CourseTable*>(parent)->tableName;
	if(diff&1){
		query=String().sprintf(L"update %s set program_id=%d,%s_timestart='%s',%s_timeend='%s',%s_desc='%s' updater=%d where %s_id=%d",tbn,ent->program->getID(),tbn,ent->start.FormatString("hh:nn"),tbn,ent->end.FormatString("hh:nn"),tbn,ent->desc,parent->parent->getUID(),tbn,this->id);
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
			query+=String().sprintf(L"delete from dates%s where %s_id=%d and dates%s_date in (",tbn,tbn,this->id,tbn);
			String addString="insert into changes(changes_table,changes_user,changes_time,changes_rid,changes_action) values ";
			for(int i=0;i<remove.size()-1;++i){
				dl=dynamic_cast<DateLesson*>(remove[i]);
				query+=String().sprintf(L"'%s',",dl->date.FormatString("yyyy-mm-dd"));
				addString+=String().sprintf(L"('%s',%d,Now(),%d,'DELETE'),",L"datesplantable",parent->parent->getUID(),this->id);
				it=std::find(dates.begin(),dates.end(),remove[i]);
				delete *it;
				dates.erase(it);
			}
			dl=dynamic_cast<DateLesson*>(remove[remove.size()-1]);
			query+=String().sprintf(L"'%s')\n",dl->date.FormatString("yyyy-mm-dd"));
			addString+=String().sprintf(L"('%s',%d,Now(),%d,'DELETE');",L"datesplantable",parent->parent->getUID(),this->id);
			query+=addString;
			it=std::find(dates.begin(),dates.end(),remove[remove.size()-1]);
			delete *it;
			dates.erase(it);
		}
		if(add.size()>0){
			if(diff&1 || remove.size()>0)query+="\n";
			query+=String().sprintf(L"insert into dates%s (%s_id, dates%s_date, dates%s_class,creator) values ",tbn,tbn,tbn,tbn);
			for(int i=0;i<add.size()-1;++i){
				dl=dynamic_cast<DateLesson*>(add[i]);
				query+=String().sprintf(L"(%d,%d,%d,%d),",this->id,dl->date.FormatString("yyyy-mm-dd"),dl->room->getID(),parent->parent->getUID());
				dates.push_back(new DateLesson(*add[i]));
			}
			dl=dynamic_cast<DateLesson*>(add[add.size()-1]);
			query+=String().sprintf(L"(%d,%d,%d,%d);",this->id,dl->date.FormatString("yyyy-mm-dd"),dl->room->getID(),parent->parent->getUID());
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
void Course::removeSlave(KAEntity* entity){
	if(dynamic_cast<Program*>(entity)!=0 && dynamic_cast<Program*>(entity)==this->program){
		for(int i=0;i<this->parent->size();++i){
			if(this->parent->at(i)==this)this->parent->erase(this->parent->begin()+i);
			delete this;
		}
	}
}
Course::~Course(){
	for(int i=0;i<dates.size();++i) delete dates[i];
}

CourseTable::CourseTable(SDODBImage *parent){
	this->parent=parent;
	//this->months.push_back(TDateTime::CurrentDate());
}
bool CourseTable::createEntities(std::vector<KAEntity*> &entities){
	bool result=true;
	for(int i=0;i<entities.size() && result;++i)result=!isHas(entities[i]) && entities[i]->validate();
	if(result){
		String query;
		this->createQueryBuilder(query,entities);
		parent->connection->Execute(query);
		query=String().sprintf(L"SELECT %s_id FROM %s order by %s_createtime desc  limit %d;",tableName,tableName,tableName,entities.size());
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
			queries->StrictDelimiter=true;
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
	query=String().sprintf(L"delete from %s where  %s_id in (",tableName,tableName);
	String addString="insert into changes(changes_table,changes_user,changes_time,changes_rid,changes_action) values ";
	for(int i=0;i<entities.size();++i){
		ent=dynamic_cast<Group*>(entities[i]);
		if(i!=entities.size()-1){
			query+=String().sprintf(L"%d,",ent->id);
			addString+=String().sprintf(L"('%s',%d,Now(),%d,'DELETE'),",tableName,parent->getUID(),ent->id);
		}
		else{
			query+=String().sprintf(L"%d);\n",ent->id);
			addString+=String().sprintf(L"('%s',%d,Now(),%d,'DELETE');",tableName,parent->getUID(),ent->id);
		}
	}
	query+=addString;
	return true;
}
bool CourseTable::createQueryBuilder(String& query,std::vector<KAEntity*> &entities){
	Course *ent;
	query=String().sprintf(L"insert into %s(%s_id,%s_timestart,%s_timeend, %s_desc,creator) values ",tableName,tableName,tableName,tableName,tableName);
	for(int i=0;i<entities.size();++i){
		ent=dynamic_cast<Course*>(entities[i]);
		query+=String().sprintf(L"(%d,'%s','%s','%s',%d)",ent->getID(),ent->start.FormatString("hh:nn"),ent->end.FormatString("hh:nn"),ent->desc,parent->getUID());
		if(i!=entities.size()-1)query+=",";else query+=";";
	}
	return true;
}
bool CourseTable::createSubQueryBuilder(String &query,std::vector<KAEntity*> &entities){
	query=String().sprintf(L"insert into dates%s(%s_id,dates%s_date,dates%s_class,creator) values ",tableName,tableName,tableName);
	Course *ent;
	for(int i=0;i<entities.size();++i){
		ent=dynamic_cast<Course*>(entities[i]);
		for(int j=0;j<ent->dates.size();++j){
			query+=String().sprintf(L"(%d,'%s',%d,%d),",ent->getID(),ent->dates[j]->date.FormatString("yyyy-mm-dd"),ent->dates[j]->room->getID(),parent->getUID());
		}
	}
	if(*query.LastChar()==L','){
		query+=query.SubString(0,query.Length())+";\n";
		return true;
	}
	return false;
}
void CourseTable::addMonth(TDate month){
	unsigned short year,monthh,day,year2,month2;
	for(int i=0;i<this->months.size();++i){
		months[i].DecodeDate(&year,&monthh,&day);
		month.DecodeDate(&year2,&month2,&day);
		if(year==year2 && monthh==month2)return;
	}
	this->months.push_back(month);
}

PlanTable::PlanTable(SDODBImage *parent):CourseTable(parent){
	this->tableName="plantable";
}

RealTable::RealTable(SDODBImage *parent):CourseTable(parent){
	this->tableName="realtable";
}

SDODBImage::SDODBImage(TADOConnection *connection,int uid):programs(0),groups(0),rooms(0),specifics(0){
	this->uid=uid;
	this->connection=connection;
	this->timer=new TTimer(0);
	timer->OnTimer=checkUpdates;
	timer->Interval=10000;
	timer->Enabled=true;
	refreshSpecifics();
	refreshGroups();
	refreshRooms();
	refreshPrograms();
	this->realTable=new RealTable(this);
    this->planTable=new PlanTable(this);
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
	query.Close();
	delete &query;
}
void SDODBImage::refreshRooms(){
	if(rooms!=0){
		rooms->debind();
		for(int i=0;i<rooms->size();++i)delete rooms->at(i);
		rooms->clear();
	} else rooms=new Rooms(this);
	TADOQuery &query=*(new TADOQuery(0));
	query.SQL->Add("select class_id, class_name, class_stcapacity, class_isrent from class;");
	query.Connection=this->connection;
	query.Active=true;
	ClassRoom *room;
	for(int i=0;i<query.RecordCount;++i){
		room=new ClassRoom(query["class_name"],query["class_stcapacity"], query["class_isrent"]);
		room->id=query["class_id"];
		room->parent=rooms;
		rooms->push_back(room);
		query.Next();
	}
	query.Close();
	query.SQL->Clear();
	query.SQL->Add("select class_id, specificity_id from specclass;");
	query.Active=true;
	Specific * spec;
	for(int i=0;i<query.RecordCount;++i){
		spec=dynamic_cast<Specific*>(this->specifics->getById(query["specificity_id"]));
		room=dynamic_cast<ClassRoom*>(rooms->getById(query["class_id"]));
		if(room!=0 && spec!=0)	room->specifics.push_back(spec);
	}
	query.Close();
	delete &query;
}
void SDODBImage::refreshGroups(){
	if(groups!=0){
		groups->debind();
		for(int i=0;i<groups->size();++i)delete groups->at(i);
		groups->clear();
	} else groups=new Groups(this);
	TADOQuery &query=*(new TADOQuery(0));
	query.SQL->Add("select group_id, group_name, group_isactual from sdo.group;");
	query.Connection=this->connection;
	query.Active=true;
	Group *group;
	for(int i=0;i<query.RecordCount;++i){
		group=new Group(query["group_name"],query["group_isactual"]);
		group->id=query["group_id"];
		group->parent=groups;
		groups->push_back(group);
		query.Next();
	}
	query.Close();
	query.SQL->Clear();
	query.SQL->Add("select group_id, groupplan_year,groupplan_count from groupplan;");
	query.Active=true;
	std::pair<int,int>* plan;
	for(int i=0;i<query.RecordCount;++i){
		plan=new std::pair<int,int>(query["groupplan_year"],query["groupplan_count"]);
		group=dynamic_cast<Group*>(this->groups->getById(query["group_id"]));
		if(group!=0)group->plan.push_back(plan);
	}
	query.Close();
	delete &query;
}
void SDODBImage::refreshPrograms(){
	if(programs!=0){
		programs->debind();
		for(int i=0;i<programs->size();++i)delete programs->at(i);
		programs->clear();
	} else programs=new Programs(this);
	TADOQuery &query=*(new TADOQuery(0));
	query.SQL->Add("select program_id, program_name, program_key, program_istraining, program_isactual, program_stcapacity from program;");
	query.Connection=this->connection;
	query.Active=true;
	Program *program;
	for(int i=0;i<query.RecordCount;++i){
		program=new Program(query["program_name"],query["program_key"], query["program_stcapacity"],query["program_istraining"],query["program_isactual"]);
		program->id=query["program_id"];
		program->parent=programs;
		programs->push_back(program);
		query.Next();
	}
	query.Close();
	query.SQL->Clear();
	query.SQL->Add("select program_id, programplan_year,programplan_count from programplan;");
	query.Active=true;
	std::pair<int,int>* plan;
	for(int i=0;i<query.RecordCount;++i){
		plan=new std::pair<int,int>(query["programplan_year"],query["programplan_count"]);
		program=dynamic_cast<Program*>(this->programs->getById(query["program_id"]));
		if(program!=0)program->plan.push_back(plan);
	}
	query.Close();
	query.SQL->Clear();
	query.SQL->Add("select program_id, specificity_id from specprogram;");
	query.Active=true;
	Specific * spec;
	for(int i=0;i<query.RecordCount;++i){
		spec=dynamic_cast<Specific*>(this->specifics->getById(query["specificity_id"]));
		program=dynamic_cast<Program*>(programs->getById(query["program_id"]));
		if(program!=0 && spec!=0){
			program->specifics.push_back(spec);
			spec->addOwner(program);
		}
	}
	query.Close();
	query.SQL->Clear();
	query.SQL->Add("select program_id, group_id from programgroups;");
	query.Active=true;
	Group * group;
	for(int i=0;i<query.RecordCount;++i){
		group=dynamic_cast<Group*>(this->groups->getById(query["group_id"]));
		program=dynamic_cast<Program*>(programs->getById(query["program_id"]));
		if(program!=0 && group!=0)	program->groups.push_back(group);
	}
	query.Close();
	query.SQL->Clear();
	query.SQL->Add("select program_id, programtime_start,programtime_end from programtime;");
	query.Active=true;
	std::pair<TDateTime,TDateTime>* times;
	for(int i=0;i<query.RecordCount;++i){
		times=new std::pair<TDateTime,TDateTime>(StrToDateTime(query["programtime_start"]),StrToDateTime(query["programtime_end"]));
		program=dynamic_cast<Program*>(this->programs->getById(query["program_id"]));
		if(program!=0)program->times.push_back(times);
	}
	query.Close();
	delete &query;
}
void SDODBImage::refreshTable(String tableName){
	CourseTable *table;
	if(tableName=="plantable"){
		if(planTable!=0){
			planTable->debind();
			for(int i=0;i<planTable->size();++i)delete planTable->at(i);
			planTable->clear();
		} else planTable=new PlanTable(this);
		table=planTable;
	}else if(tableName=="realtable"){
		if(realTable!=0){
			realTable->debind();
			for(int i=0;i<realTable->size();++i)delete realTable->at(i);
			realTable->clear();
		} else realTable=new RealTable(this);
		table=realTable;
	}

	if(table->months.size()>0){
		TADOQuery &query=*(new TADOQuery(0));
//CHECK ON THE PRACTICE
		String tq=String().sprintf(L"(dates%s_date>='%%s' and dates%s_date<'%%s')",tableName,tableName);
		String condq;
		for(int i=0;i<table->months.size();++i){
			condq+=String().sprintf(tq.w_str(),table->months[i].FormatString("yyyy-mm-01").w_str(),(table->months[i]+32).FormatString("yyyy-mm-01").w_str());
			if(i+1!=table->months.size())condq+=" and ";
		}
		String qS=String().sprintf(L"SELECT %s_id as id,dates%s_date as date, dates%s_class as class FROM dates%s where ",tableName.w_str(),tableName.w_str(),tableName.w_str(),tableName.w_str());
		qS+=condq+";";
		query.SQL->Add(qS);
		query.Connection=this->connection;
		query.Active=true;
		std::map<int,std::vector<DateLesson*>*> ls;
		std::map<int,std::vector<DateLesson*>*>::iterator it;
		for(int i=0;i<query.RecordCount;++i){
			DateLesson* dt;
			dt=new DateLesson();
			dt->date=StrToDate(query["date"]);
			dt->room=dynamic_cast<ClassRoom*>(this->rooms->getById(query["class"]));
			if(ls.find(query["id"])!=ls.end()){
				it=ls.find(query["id"]);
				it->second->push_back(dt);
			}else{
				ls[query["id"]]=new std::vector<DateLesson*>();
				ls[query["id"]]->push_back(dt);
			}
			query.Next();
		}
		query.SQL->Clear();
		query.Close();
		if(ls.size()>0){
			qS=String().sprintf(L"SELECT %s_id as id,program_id, %s_timestart as start, %s_timeend as end, %s_desc as descr FROM %s where ",tableName.w_str(),tableName.w_str(),tableName.w_str(),tableName.w_str(),tableName.w_str());
			condq=String().sprintf(L"%s_id in(",tableName.w_str());
			it=ls.begin();
			condq+=IntToStr(it->first);
			++it;
			for(it;it!=ls.end();++it){
				condq+=","+IntToStr(it->first);
			}
			condq+=");";
			qS+=condq;
			query.SQL->Add(qS);
			query.Active=true;
			Course *course;
			for(int i=0;i<query.RecordCount;++i){
				course=new Course((Program*)programs->getById(query["program_id"]),StrToDateTime(query["start"]),StrToDateTime(query["end"]),ls[query["id"]],query["descr"]);
				course->parent=table;
				table->push_back(course);
			}
		}
		for(it=ls.begin();it!=ls.end();++it){
			while(it->second->size()>0){
				delete it->second->at(0);
				it->second->erase(it->second->begin());
			}
			delete it->second;
        }
		ls.clear();
		query.Close();
		delete &query;
	}
}
void SDODBImage::refreshPlantable(){
	refreshTable("plantable");
}
void SDODBImage::refreshRealtable(){
	refreshTable("realtable");
}
Specifics * SDODBImage::getSpecifics(){
	return specifics;
}
Groups *SDODBImage::getGroups(){
	return groups;
}
Programs *SDODBImage::getPrograms(){
	return programs;
}
Rooms *SDODBImage::getRooms(){
	return rooms;
}
RealTable *SDODBImage::getRealTable(){return this->realTable;};
PlanTable *SDODBImage::getPlanTable(){return this->planTable;};
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

