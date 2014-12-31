//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "CourseModal.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"

//---------------------------------------------------------------------------
__fastcall TCourseModal::TCourseModal(TComponent* Owner)
	: TModalEntityForm(Owner)
{
}
//---------------------------------------------------------------------------

void TCourseModal::writeToEntity(KAEntity *ent){
}
void TCourseModal::writeToForm(KAEntity *ent){

}
