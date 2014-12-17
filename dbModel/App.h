//---------------------------------------------------------------------------

#ifndef AppH
#define AppH
#include <Data.Win.ADODB.hpp>
#include "CoreData.h"
class App{
public:
	static void init();
	static void saveAuth();
	static void destruct();
	static void updateCookie();
	static void initDbModel();
	static bool isConnectionActive();
	static String login;
	static String password;
	static int uid;
	static int cookie;
	static SDODBImage *db;
	static TADOConnection *connection;
protected:
	static wchar_t buffer[MAX_PATH];

};

//---------------------------------------------------------------------------
#endif
