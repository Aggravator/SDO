//---------------------------------------------------------------------------

#ifndef CoreDataH
#define CoreDataH
#include <Data.Win.ADODB.hpp>
#include <vector>
#include <algorithm>
#include <Vcl.ExtCtrls.hpp>
#include <map>

class KAEntityTable;
class SDODBImage;
class Specifics;
class Program;
class KAEntity{
public:
	bool deleteEntity();
	bool updateEntity(KAEntity *entity);
	virtual const KAEntity& operator= (const KAEntity& entity)=0;
	virtual bool validate()const =0;
	virtual int isDifferent(KAEntity *entity)const =0;
	int getID();
	void addOwner(KAEntity* entity);
	void removeOwner(KAEntity* entity);
	virtual void debind();
    virtual void debind(KAEntity *entity);
	virtual void removeSlave(KAEntity* entity)=0;
	KAEntity();
	virtual ~KAEntity();
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
	Specific(const Specific &specific);
	Specific& operator =(const KAEntity& entity);
	bool validate()const;
	int isDifferent(KAEntity *entity)const;
	void removeSlave(KAEntity* entity);
	String name;
	protected:
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
	ClassRoom(String name,int capacity,bool isrent,std::vector<Specific*> *specifics=0);
	ClassRoom(const ClassRoom &classRoom);
	ClassRoom& operator =(const KAEntity& entity);
	bool validate()const;
	int isDifferent(KAEntity *entity)const;
	void removeSlave(KAEntity* entity);
	String getName()const;
protected:
	bool updateQueryBuilder(String &query,KAEntity *entity);
	String name;
	int capacity;
	bool isrent;
	std::vector<Specific*> specifics;
	friend class Rooms;
	friend class SDODBImage;
private:
	void init(String name,int capacity,bool isrent,std::vector<Specific*> *specifics=0);
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
	Group(String name,bool isactual,std::vector<std::pair<int,int>*> *plan=0);
	Group(const Group &group);
	Group& operator =(const KAEntity& entity);
	bool validate()const;
	int isDifferent(KAEntity *entity)const;
	void removeSlave(KAEntity* entity);
	~Group();
private:
	void init(String name,bool isactual,const std::vector<std::pair<int,int>*> *plan=0);
protected:
	bool updateQueryBuilder(String &query,KAEntity *entity);
	String name;
	bool isactual;
	std::vector<std::pair<int,int>*> plan;
	friend class Groups;
	friend class Programs;
	friend class SDODBImage;
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
	Program(String name,String key,int capacity,bool istraining,bool isactual,unsigned color=16777215,std::vector<Specific*> *specifics=0,std::vector<std::pair<int,int>*> *plan=0,std::vector<Group*> *groups=0,std::vector<std::pair<TDateTime,TDateTime>*> *times=0);
	Program(const Program &program);
	Program& operator =(const KAEntity& entity);
	bool validate()const;
	int isDifferent(KAEntity *entity)const;
	void removeSlave(KAEntity* entity);
	~Program();
private:
	void init(String name,String key,int capacity,bool istraining,bool isactual,unsigned color=16777215,const std::vector<Specific*> *specifics=0,const std::vector<std::pair<int,int>*> *plan=0,const std::vector<Group*> *groups=0,const std::vector<std::pair<TDateTime,TDateTime>*> *times=0);
protected:
	bool updateQueryBuilder(String &query,KAEntity *entity);
	String name,key;
	int capacity;
	bool istraining,isactual;
	unsigned color;
	std::vector<Specific*> specifics;
	std::vector<std::pair<int,int>*> plan;
	std::vector<std::pair<TDateTime,TDateTime>*> times;
	std::vector<Group*> groups;
	friend class Programs;
	friend class SDODBImage;
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
	TDate date;
	ClassRoom *room;
};
class Course:public KAEntity{
public:
	Course(Program* program,TDateTime start,TDateTime end,std::vector<DateLesson*> *dates,String desc);
	Course(const Course &course);
	Course& operator =(const KAEntity& entity);
	bool validate()const;
	int isDifferent(KAEntity *entity)const;
	void removeSlave(KAEntity* entity);
	~Course();
private:
	void init(Program* program,TDateTime start,TDateTime end,const std::vector<DateLesson*> *dates,String desc);
protected:
	bool updateQueryBuilder(String &query,KAEntity *entity);
	Program* program;
	TDateTime start;
	TDateTime end;
	String desc;
	std::vector<DateLesson*> dates;
	friend class CourseTable;
	friend class SDODBImage;
};

class CourseTable:public KAEntityTable{
public:
	CourseTable(SDODBImage *parent);
	bool createEntities(std::vector<KAEntity*> &entities);
	void addMonth(TDate);
protected:
	String tableName;
	std::vector<TDate> months;
	bool deleteQueryBuilder(String &query,std::vector<KAEntity*> &entities);
	bool createQueryBuilder(String &query,std::vector<KAEntity*> &entities);
	bool createSubQueryBuilder(String &query,std::vector<KAEntity*> &entities);
	friend class Course;
	friend class SDODBImage;
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
	SDODBImage(TADOConnection *connection,int uid);
	int getUID();
	Specifics * getSpecifics();
	Groups *getGroups();
	Programs *getPrograms();
	Rooms *getRooms();
	RealTable *getRealTable();
	PlanTable *getPlanTable();
	void refreshSpecifics();
	void refreshRooms();
	void refreshGroups();
	void refreshPrograms();
	void refreshPlantable();
	void refreshRealtable();
	~SDODBImage();
protected:
	void refreshTable(String tableName);
	void __fastcall checkUpdates(TObject *Sender);
	int uid;
	Programs *programs;
	Groups *groups;
	Rooms *rooms;
	Specifics *specifics;
	RealTable *realTable;
	PlanTable *planTable;
	TADOConnection *connection;
	TTimer *timer;
	friend class KAEntity;
	friend class KAEntityTable;
	friend class Specifics;
	friend class Rooms;
	friend class Room;
	friend class Groups;
	friend class Group;
	friend class Programs;
	friend class Program;
	friend class CourseTable;
};

#endif
