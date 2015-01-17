//---------------------------------------------------------------------------

#ifndef AppH
#define AppH
#include <Data.Win.ADODB.hpp>
#include "CoreData.h"
#include "GroupModal.h"
#include "RoomModal.h"
#include <typeinfo>
class SDODBImage;
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
	struct ModalForms{
		static TRoomModal* roomModal;
		static TGroupModal* groupModal;

		static void initForm(TModalEntityForm* *modalForm){
			if(modalForm==&groupModal){
				try {typeid(*groupModal);}
				catch (...){groupModal=new TGroupModal(0);}
			}
			if(modalForm==&roomModal){
				try {typeid(*roomModal);}
				catch (...){roomModal=new TRoomModal(0);}
			}
		}
	};
protected:
	static wchar_t buffer[MAX_PATH];

};

//---------------------------------------------------------------------------
#endif
