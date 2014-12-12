//---------------------------------------------------------------------------

#ifndef CoreDataH
#define CoreDataH
#include <Data.Win.ADODB.hpp>
#include <vector>
#include <algorithm>
#include <Vcl.ExtCtrls.hpp>

class KAEntityTable;
class SDODBImage;
class Specifics;
class Program;
class KAEntity{
public:
	bool deleteEntity();
	bool updateEntity(KAEntity *entity);
	virtual bool validate()const =0;
	virtual int isDifferent(KAEntity *entity)const =0;
	int getID();
	void addOwner(KAEntity* entity);
	void removeOwner(KAEntity* entity);
	virtual void debind();
    virtual void debind(KAEntity *entity);
	virtual void removeSlave(KAEntity* entity)=0;
protected:
	int id;
	std::vector<KAEntity*> owners;
	virtual bool updateQueryBuilder(String &query,KAEntity *entity)=0;
	KAEntityTable *parent;
	friend class KAEntityTable;
	friend class Rooms;
	friend class Groups;
	friend class Programs;
	friend class CourseTable;
	friend class SDODBImage;
};
class KAEntityTable:public std::vector<KAEntity*>{
public:
	virtual bool deleteEntities(std::vector<KAEntity*> &entities);
	virtual bool createEntity(KAEntity *entity);
	virtual bool createEntities(std::vector<KAEntity*> &entities)=0;
	KAEntity * getById(int id);
	bool isHas(KAEntity* entity);
	SDODBImage * parent;
	virtual void debind();
protected:
	virtual bool deleteQueryBuilder(String& query,std::vector<KAEntity*> &entities)=0;
	virtual bool createQueryBuilder(String &query,std::vector<KAEntity*> &entities)=0;
	friend class KAEntity;
};

class Specific:public KAEntity{
public:
	Specific(String name);
	bool validate()const;
	int isDifferent(KAEntity *entity)const;
	void removeSlave(KAEntity* entity);
protected:
	String name;
	bool updateQueryBuilder(String &query,KAEntity *entity);
	friend class Specifics;
};

class Specifics:public KAEntityTable{
public:
	Specifics(SDODBImage *parent);
	bool createEntities(std::vector<KAEntity*> &entities);
protected:
	bool deleteQueryBuilder(String& query,std::vector<KAEntity*> &entities);
	bool createQueryBuilder(String &query,std::vector<KAEntity*> &entities);
};

class ClassRoom:public KAEntity{
public:
	ClassRoom(String name,int capacity,bool isrent,std::vector<Specific*> &specifics);
	bool validate()const;
	int isDifferent(KAEntity *entity)const;
	String getName()const;
protected:
	bool updateQueryBuilder(String &query,KAEntity *entity);
	String name;
	int capacity;
	bool isrent;
	std::vector<Specific*> specifics;
	friend class Rooms;
};

class Rooms:public KAEntityTable{
public:
	Rooms(SDODBImage *parent);
	bool createEntities(std::vector<KAEntity*> &entities);
protected:
	bool deleteQueryBuilder(String &query,std::vector<KAEntity*> &entities);
	bool createQueryBuilder(String &query,std::vector<KAEntity*> &entities);
	bool createSubQueryBuilder(String &query,std::vector<KAEntity*> &entities);
};
class Group:public KAEntity{
public:
	Group(String name,std::vector<std::pair<int,int>*> &plan);
	bool validate()const;
	int isDifferent(KAEntity *entity)const;
	~Group();
protected:
	bool updateQueryBuilder(String &query,KAEntity *entity);
	String name;
	std::vector<std::pair<int,int>*> plan;
	friend class Groups;
	friend class Programs;
};
class Groups:public KAEntityTable{
public:
	Groups(SDODBImage *parent);
	bool createEntities(std::vector<KAEntity*> &entities);
protected:
	bool deleteQueryBuilder(String &query,std::vector<KAEntity*> &entities);
	bool createQueryBuilder(String &query,std::vector<KAEntity*> &entities);
	bool createSubQueryBuilder(String &query,std::vector<KAEntity*> &entities);
};
class Program:public KAEntity{
public:
	Program(String name,String key,int capacity,bool istraining,bool isactual,std::vector<Specific*> &specifics,std::vector<std::pair<int,int>*> &plan,std::vector<Group*> &groups);
	bool validate()const;
	int isDifferent(KAEntity *entity)const;
	~Program();
protected:
	bool updateQueryBuilder(String &query,KAEntity *entity);
	String name,key;
	int capacity;
	bool istraining,isactual;
	std::vector<Specific*> specifics;
	std::vector<std::pair<int,int>*> plan;
	std::vector<std::pair<TDateTime,TDateTime>*> times;
	std::vector<Group*> groups;
	friend class Programs;
};
class  Programs:public KAEntityTable{
public:
	Programs(SDODBImage *parent);
	bool createEntities(std::vector<KAEntity*> &entities);
protected:
	bool deleteQueryBuilder(String &query,std::vector<KAEntity*> &entities);
	bool createQueryBuilder(String &query,std::vector<KAEntity*> &entities);
	bool createSubQueryBuilder(String &query,std::vector<KAEntity*> &entities);
};

struct DateLesson{
	TDateTime date;
	ClassRoom *room;
};
class Course:public KAEntity{
public:
	Course(Program* program,TDateTime start,TDateTime end,std::vector<DateLesson*> &dates,String desc);
	bool validate()const;
	int isDifferent(KAEntity *entity)const;
	~Course();
protected:
	bool updateQueryBuilder(String &query,KAEntity *entity);
	Program* program;
	TDateTime start;
	TDateTime end;
	String desc;
	std::vector<DateLesson*> dates;
	friend class CourseTable;
};

class CourseTable:public KAEntityTable{
public:
	CourseTable(SDODBImage *parent);
	bool createEntities(std::vector<KAEntity*> &entities);
protected:
	String tableName;
	bool deleteQueryBuilder(String &query,std::vector<KAEntity*> &entities);
	bool createQueryBuilder(String &query,std::vector<KAEntity*> &entities);
	bool createSubQueryBuilder(String &query,std::vector<KAEntity*> &entities);
	friend class Course;
};

class PlanTable:public CourseTable{
public:
	PlanTable(SDODBImage *parent);
};

class RealTable:public CourseTable{
public:
	RealTable(SDODBImage *parent);
};

class SDODBImage{
public:
	SDODBImage(TADOConnection *connection);
	int getUID();
	Specifics * getSpecifics();
	Groups *getGroups();
	Programs *getPrograms();
	Rooms *getRooms();
	~SDODBImage();
protected:
	void refreshSpecifics();
	void __fastcall checkUpdates(TObject *Sender);
	int uid;
	Programs *programs;
	Groups *groups;
	Rooms *rooms;
	Specifics *specifics;
	TADOConnection *connection;
	TTimer *timer;
	friend class KAEntity;
	friend class KAEntityTable;
	friend class Specifics;
	friend class Rooms;
	friend class Groups;
	friend class Programs;
	friend class CourseTable;
};

#endif
