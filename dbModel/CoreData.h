//---------------------------------------------------------------------------

#ifndef CoreDataH
#define CoreDataH
#include <Data.Win.ADODB.hpp>
#include <vector>
#include <algorithm>

class KAEntityTable;
class KAEntity{
public:
	bool deleteEntity();
	bool updateEntity();
private:
	KAEntityTalbe *parent;
};
class KAEntityTable:public std::vector<KAEntity*>{
public:
	bool deleteEntities(std::vector<KAEntity*> &entities);
	bool createEntity(KAEntity *entity);
};
class Specifics;
class Program;
class SDODBImage;
class Specific{
public:
	bool update();
	bool deleteSpecific();
private:
	Specific();
	Specific(int id,String* name,Specifics *parent);
	Specific(Specific &spec);
	Specifics *parent;
	int id;
	String name;
	friend class Specifics;
};
class Specifics:public std::vector<Specific*>{
public:
	bool update();
	std::vector<Specific*>::iterator erase(std::vector<Specific*>::iterator position);
	bool createSpecific(String* name);
	bool deleteSpecifics(std::vector<Specific*> &specifics);
	Specifics(SDODBImage *parent);
private:
	SDODBImage *parent;
};
class ClassRoom{
public:
	bool update();
	bool deleteRoom();
private:
	int id;
	String name;
	int capacity;
	bool isrent;
	std::vector<Specific*> specifics;
	ClassRoom();
	ClassRoom(ClassRoom&);
};
class Rooms:public std::vector<ClassRoom*>{
public:
	bool createRoom(String* name,int capacity,bool isrent,std::vector<Specific*> &specifics);
	bool deleteRooms(std::vector<ClassRoom*>& rooms);
	bool update();
private:

};
class Group{
public:
	bool update();
	bool deleteGroup();
private:
	String id;
	String name;
	std::vector<std::pair<int,int>*> plan;
	std::vector<Program*> programs;
};
class Groups:public std::vector<Group*>{
public:
	bool createGroup(const String* name,std::vector<std::pair<int,int>*>& plan);
private:
};
class Program{
public:
	bool deleteProgram();
	bool update();
	Program(SDODBImage *dbImage);
private:
	int id;
	String name,key;
	int capacity;
	bool istraining,isactual;
	std::vector<Specific*> specifics;
	std::vector<std::pair<int,int>*> plan;
	std::vector<Group*> groups;
};
class  Programs:public std::vector<Program*>{
public:
	bool createProgram(const String* name,const String* key,int capacity,bool istraining,bool isactual,std::vector<Specific*> &specifics,std::vector<Group*> &groups);
	bool deletePrograms(std::vector<Program*>& programs);
private:
};

class Course{
public:
    bool deleteCourse();
private:
	int id;
	Program* program;
	TDateTime start;
	TDateTime end;
	String desc;
	std::vector<TDateTime*> dates;
};

class PlanTable:public std::vector<Course*>{
public:
	bool createCourse(int id,Program* program,TDateTime start,TDateTime end,String desc,std::vector<TDateTime*> &dates);
private:
};
class RealTable:public std::vector<Course*>{
public:
	bool createCourse(int id,Program* program,TDateTime start,TDateTime end,String desc,std::vector<TDateTime*> &dates);
private:
};
class SDODBImage{
public:
	SDODBImage(TADOConnection *connection);
	int getUID();
private:
	int uid;
	Programs *programs;
	Groups *groups;
	Rooms *rooms;
	Specifics *specifics;
	TADOConnection *connection;
	friend class Specifics;
	friend class Rooms;
	friend class Groups;
	friend class Programs;
};

#endif