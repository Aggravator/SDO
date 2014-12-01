//---------------------------------------------------------------------------

#ifndef CoreDataH
#define CoreDataH
#include <Data.Win.ADODB.hpp>
#include <vector>
class Specific{
public:
private:
	int id;
	String name;
}
class ClassRoom{
public:
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
	createRoom(const String* name,int capacity,bool isrent,std::vector<Specific*> &specifics);
private:

};
class Program{
public:
private:
	int id;
	String name,key;
};
class SDODBImage{
public:
	SDODBImage(TADOConnection *connection);
private:
	TADOConnection *connection;
};

#endif
