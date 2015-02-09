//---------------------------------------------------------------------------

#ifndef ComplexEntitiesFormH
#define ComplexEntitiesFormH
#include <vector>
#include "App.h"
#include "CoreData.h"
//---------------------------------------------------------------------------
class EntityRow;

class ARowsPanel;

class TComplexEntitiesForm: public TForm{
public:
	__fastcall TComplexEntitiesForm(TComponent* Owner);
	TModalEntityForm* *modalForm;
	ARowsPanel *panel;
	TImageList *images;
protected:
	void __fastcall onShow(TObject *Sender);
	//void __fastcall onAddButton(TObject *Sender);
	void __fastcall onOkButton(TObject *Sender);
};

class AEntityRow{
public:
	AEntityRow(ARowsPanel* parent, int size);
	void addToPanel();
	void removeFromPanel();
	void hideInPanel();
	void initWithEntity(KAEntity* entity);
	KAEntity *initEntity,*tempEntity;
	virtual ~AEntityRow();
protected:
	ARowsPanel *parent;
	std::vector<TControl*> controls;

	TButton *editButton,*deleteButton;
	virtual void writeToRow(KAEntity* entity)=0;
	virtual void writeToEntity(KAEntity* entity)=0;
	void __fastcall editButtonClick(TObject *Sender);
	void __fastcall deleteButtonClick(TObject *Sender);
	friend class ARowsPanel;
};


class  ARowsPanel:public TGridPanel{
public:
	void hideRow(AEntityRow* row);
	virtual void addRow(KAEntity*)=0;
	void deleteRow(AEntityRow* row);
	void applyChanges();
	void clear();
	std::vector<AEntityRow*> rows;
	std::vector<AEntityRow*> deletedRows;
	std::vector<KAEntity*> deleteEntities;
	int rowHeight;
	__fastcall ARowsPanel(TComponent *Owner);
	__fastcall virtual ~ARowsPanel();
protected:
	KAEntityTable *entTable;
	friend EntityRow;
	friend class TComplexEntitiesForm;
};

template <class T=AEntityRow,int size=4>
class RRowsPanel:public ARowsPanel{
private:
//	int size;
public:
	__fastcall RRowsPanel(TComponent *Owner):ARowsPanel(Owner){
	}
	__fastcall virtual ~RRowsPanel(){
    }
	void addRow(KAEntity* ent){
		ARowsPanel *rp=this;
		T *row=new T(rp,size);
		row->initWithEntity(ent);
		row->addToPanel();
		this->rows.push_back(row);
	}
};
#endif
