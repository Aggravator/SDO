//---------------------------------------------------------------------------

#ifndef EntitiesFormH
#define EntitiesFormH
#include <Vcl.Forms.hpp>
#include <vector>
#include "EntitiesForm.h"
#include "ModalEntityForm.h"
class RowsPanel;
class TEntitiesForm:public TForm{
public:
	__fastcall TEntitiesForm(TComponent* Owner);
	TModalEntityForm* *modalForm;
	RowsPanel *panel;
	TImageList *images;
};
class EntityRow{
public:
	RowsPanel *parent;
	KAEntity *initEntity,*tempEntity;
	TButton *editButton,*deleteButton;
	virtual void writeToRow(KAEntity* entity)=0;
	virtual void writeToEntity(KAEntity* entity)=0;
	void ondelete();
	void onedit();
	void init(KAEntity *entity=0);
	EntityRow(RowsPanel* parent);
	virtual ~EntityRow();
};
class  RowsPanel:public TGridPanel{
public:
	KAEntityTable *entTable;
	std::vector<EntityRow*> rows;
	std::vector<KAEntity*> deleteEntities;
	void deleteRow(EntityRow*);
	void debindRowControls(EntityRow*);
	void clear();
	virtual EntityRow* addRow(KAEntity *entity=0)=0;
	int rowHeight;
	public:
	void applyChanges();
	__fastcall RowsPanel(TComponent *Owner);
	__fastcall virtual ~RowsPanel();
};
//---------------------------------------------------------------------------
#endif
