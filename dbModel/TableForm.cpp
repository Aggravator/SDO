//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "TableForm.h"
#include "App.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
//---------------------------------------------------------------------------
String months[]={"������","�������","����","������","���","����","����","������","��������","�������","������","�������"};
String dayOfWeek[]={"��","��","��","��","��","��","��"};

Cell::Cell(){
	hspan=vspan=1;
	cellType=EUsual;
	courseR=courseP=0;
	lessonR=lessonP=0;
}
void Cell::setSpan(int hs,int vs,String text,unsigned int flags){
	hspan=hs;
	vspan=vs;
	this->text=text;
	this->cellType=ESpan;
	this->flags=flags;
}
void Cell::setCourseSpan(int hs){
	hspan=hs;
	this->flags= DT_WORDBREAK|DT_CENTER;
	this->cellType=ECourseS;
}

__fastcall TTableForm::TTableForm(TComponent* Owner)
	: TForm(Owner)
{
	executedCourseColor=RGB(230,230,230);
	showReal=showPlan=true;
	showAllPrograms=false;
	dragCell=NULL;
	month=TDate::CurrentDate();
	realTable=App::db->getRealTable();
	planTable=App::db->getPlanTable();
	unsigned short year1,month1,day1;
	month.DecodeDate(&year1,&month1,&day1);
	month=EncodeDate(year1,month1,1);
	realTable->loadMonth(month);
	realTable->loadMonth(IncMonth( month, 1 ));
	realTable->loadMonth(IncMonth( month, -1 ));
	planTable->loadMonth(month);
	planTable->loadMonth(IncMonth( month, -1 ));
	planTable->loadMonth(IncMonth( month, 1 ));
	this->sstringRedraw();
	ccf=new TCourseCreate(this,this);
}
__fastcall TTableForm::~TTableForm(){
	clearCells();
	clearProgs();
	delete ccf;
}
bool TTableForm::isIntoPeriod(KAEntity* ent){
	Course *cr=dynamic_cast<Course*>(ent);
	TDate start=month-4;
	TDate end=IncMonth( month, 1 )+3;
	for(int i=0;i<cr->dates.size();++i){
		TDate dd=cr->dates[i]->date;
		if(cr->dates[i]->date>=start && cr->dates[i]->date<=end)return true;
	}
	return false;
}
bool sortPT (ProgTables* i,ProgTables* j) {
	if(i->prog->istraining!=j->prog->istraining){
		return i->prog->istraining>j->prog->istraining;
	}else if(i->prog->key!=j->prog->key){
		return i->prog->key<j->prog->key;
	}else if(i->prog->name!=j->prog->name){
		return i->prog->name<j->prog->name;
	}else return i->time.first<j->time.first;
}
void TTableForm::clearCells(){
	for(int i=0;i<cells.size();++i){
		for(int j=0;j<cells[i]->size();++j){
			delete cells[i]->at(j);
		}
		delete cells[i];
	}
	cells.clear();
}
void  TTableForm::clearProgs(){
	for(int i=0;i<progs.size();++i){
		delete progs[i];
	}
	progs.clear();
}
void TTableForm::prTableToVector(ProgTables* pt,std::vector<Cell*>* row){
	int fixcols=4;
	unsigned short year1,month1,day1;
	month.DecodeDate(&year1,&month1,&day1);
	int dayCount=MonthDays[IsLeapYear(year1)][month1-1];
	double diff;
	int cellPos;
	for(int i=0;i<pt->real.size();++i){
		pt->real[i]->sortDates();
		for(int j=0;j<pt->real[i]->dates.size();++j){
			diff=(int)((double)(pt->real[i]->dates[j]->date-month));
			if(diff>=-4 && diff<=dayCount+4){
				cellPos=fixcols+4+diff;
				row->at(cellPos)->courseR=pt->real[i];
				row->at(cellPos)->lessonR=pt->real[i]->dates[j];
			}
		}
	}
	for(int i=0;i<pt->plan.size();++i){
		pt->plan[i]->sortDates();
		for(int j=0;j<pt->plan[i]->dates.size();++j){
			diff=(int)((double)(pt->plan[i]->dates[j]->date-month));
			if(diff>=-4 && diff<=dayCount+4){
				cellPos=fixcols+4+diff;
				row->at(cellPos)->courseP=pt->plan[i];
				row->at(cellPos)->lessonP=pt->plan[i]->dates[j];
			}
		}
	}
	Course *spanCourse=NULL;
	Course *active=NULL;
	int spanPos=-1;
	for(int i=fixcols;i<row->size();++i){
		if(showReal && row->at(i)->courseR!=NULL && ((row->at(i)->courseP!=selectedCourse || selectedCourse==NULL) || !showPlan))
			active=row->at(i)->courseR;
		else if(showPlan && row->at(i)->courseP!=NULL)
			active=row->at(i)->courseP;
		else
			active=NULL;
		if(active==spanCourse && active!=NULL){
			row->at(i)->cellType=ECourseUS;
			row->at(spanPos)->hspan+=1;
		}else if(spanCourse!=active){
			spanCourse=active;
			if(active!=NULL){
				spanPos=i;
				row->at(i)->setCourseSpan(1);
			}
		}
    }
}
void TTableForm::sstringRedraw(){
	this->clearProgs();
	static TDate lastMonthRedraw=TDate::CurrentDate()-10000;
	int fixcols=4;
	unsigned short year1,month1,day,year2,month2;
	month.DecodeDate(&year1,&month1,&day);
	lastMonthRedraw.DecodeDate(&year2,&month2,&day);
	if(year1!=year2 || month1!=month2){
		monthLabel->Caption=months[month1-1]+", "+IntToStr(year1);
		int dayCount=MonthDays[IsLeapYear(year1)][month1-1];
		StringGrid1->ColCount=dayCount+8+fixcols;
		TDate firstDate=EncodeDate(year1,month1,1);
		for(int i=0;i<dayCount+8;++i){
			TDate dd=firstDate-4+i;
			dd.DecodeDate(&year1,&month1,&day);
			StringGrid1->Cells[fixcols+i][0]=dayOfWeek[DayOfWeek(dd)-1];
			StringGrid1->Cells[fixcols+i][1]=IntToStr(day);
		}
        lastMonthRedraw=month;
    }
	std::vector<Course*> plan,real;
	for(int i=0;i<planTable->size();++i){
		if(isIntoPeriod(planTable->at(i)))
			plan.push_back(dynamic_cast<Course*>(planTable->at(i)));
	}
	for(int i=0;i<realTable->size();++i){
		if(isIntoPeriod(realTable->at(i)))real.push_back(dynamic_cast<Course*>(realTable->at(i)));
	}
	FindPlanTByCourse finder;
	std::vector<ProgTables*>::iterator it;
	for(int i=0;i<plan.size();++i){
		finder.course=plan[i];
		it=std::find_if(progs.begin(),progs.end(),finder);
		if(it!=progs.end()){
			(*it)->plan.push_back(finder.course);
		}else{
			ProgTables *pt= new ProgTables();
			pt->prog=finder.course->program;
			pt->time=std::pair<TDateTime,TDateTime>(finder.course->start,finder.course->end);
			pt->plan.push_back(finder.course);
			progs.push_back(pt);
		}
	}
	for(int i=0;i<real.size();++i){
		finder.course=real[i];
		it=std::find_if(progs.begin(),progs.end(),finder);
		if(it!=progs.end()){
			(*it)->real.push_back(finder.course);
		}else{
			ProgTables *pt= new ProgTables();
			pt->prog=finder.course->program;
			pt->time=std::pair<TDateTime,TDateTime>(finder.course->start,finder.course->end);
			pt->real.push_back(finder.course);
			progs.push_back(pt);
		}
	}
	if(showAllPrograms){
		FindPlanTByProgTime finder2;
		Programs *pps=App::db->getPrograms();
		for(int i=0;i<pps->size();++i){
			finder2.prog=dynamic_cast<Program*>(pps->at(i));
			for(int j=0;j<finder2.prog->times.size();++j){
				finder2.time=finder2.prog->times[j];
				it=std::find_if(progs.begin(),progs.end(),finder2);
				if(it==progs.end()){
					ProgTables *pt= new ProgTables();
					pt->prog=finder2.prog;
					pt->time=*finder2.time;
					progs.push_back(pt);
				}
            }
		}
	}

	std::sort(progs.begin(),progs.end(),sortPT);
	regenerateCells(progs);
	if(progs.size()>0){
		StringGrid1->RowCount=cells.size()+2;
	}else{
		StringGrid1->RowCount=3;
		StringGrid1->Rows[2]->Clear();
    }
	stringResizing();
}
void TTableForm::regenerateCells(std::vector<ProgTables*> &progs){
	this->clearCells();
	if(progs.size()>0){
		unsigned short year1,month1,day1;
		month.DecodeDate(&year1,&month1,&day1);
		monthLabel->Caption=months[month1-1]+", "+IntToStr(year1);
		int dayCount=MonthDays[IsLeapYear(year1)][month1-1];
		int fixcols=4;
		if(progs[0]->prog->istraining!=(*--progs.end())->prog->istraining)cells.resize(2+progs.size());
		else cells.resize(1+progs.size());

		for(int i=0;i<cells.size();++i){
			cells[i]=new std::vector<Cell*>(dayCount+8+fixcols);
			for(int j=0;j<cells[i]->size();++j){
				cells[i]->at(j)=new Cell();
			}
		}
		int row=2;
		int i=0;
		Cell *cl;
		for(i;i<progs.size() && progs[i]->prog->istraining;++i){
			if(i==0){
				cl=cells[row-2]->at(0);
				cl->setSpan(cells[i]->size(),1,"��������� ������������",DT_CENTER|DT_SINGLELINE|DT_VCENTER);
				for(int j=1;j<cells[i]->size();++j)cells[row-2]->at(j)->cellType=EEmpty;
				++row;
			}
			cells[row-2]->at(0)->setSpan(1,1,progs[i]->prog->key);
			cells[row-2]->at(1)->setSpan(1,1,progs[i]->prog->name,DT_LEFT|DT_WORDBREAK);
			cells[row-2]->at(2)->setSpan(1,1,IntToStr(progs[i]->prog->hours));
			cells[row-2]->at(3)->setSpan(1,1,progs[i]->time.first.FormatString("hh:nn")+"-"+progs[i]->time.second.FormatString("hh:nn"));
			prTableToVector(progs[i],cells[row-2]);
			++row;
		}
		if(i!=progs.size()){
			cells[row-2]->at(0)->setSpan(cells[i]->size(),1,"��������",DT_CENTER|DT_SINGLELINE|DT_VCENTER);
			for(int j=1;j<cells[i]->size();++j)cells[row-2]->at(j)->cellType=EEmpty;
			++row;
		}
		for(i;i<progs.size();++i){
			cells[row-2]->at(0)->setSpan(1,1,progs[i]->prog->key);
			cells[row-2]->at(1)->setSpan(1,1,progs[i]->prog->name,DT_LEFT|DT_WORDBREAK);
			cells[row-2]->at(2)->setSpan(1,1,IntToStr(progs[i]->prog->hours));
			cells[row-2]->at(3)->setSpan(1,1,progs[i]->time.first.FormatString("hh:nn")+"-"+progs[i]->time.second.FormatString("hh:nn"));
			prTableToVector(progs[i],cells[row-2]);
			++row;
		}
	}
}
void TTableForm::stringResizing(){
	int fixcols=4;
	StringGrid1->DefaultColWidth=(StringGrid1->Width-(50+160+30+70)-StringGrid1->ColCount-fixcols)/(StringGrid1->ColCount-fixcols);
	StringGrid1->ColWidths[0]=50;
	StringGrid1->ColWidths[1]=160;
	StringGrid1->ColWidths[2]=30;
	StringGrid1->ColWidths[3]=70;
}
//---------------------------------------------------------------------------
void __fastcall TTableForm::FormResize(TObject *Sender)
{
	this->stringResizing();
}
//---------------------------------------------------------------------------
void drawBorder(TCanvas *canvas,TRect &rect){
	canvas->MoveTo(rect.left,rect.top);
	canvas->LineTo(rect.Left,rect.Bottom);
	canvas->LineTo(rect.Right,rect.Bottom);
	canvas->LineTo(rect.Right,rect.Top);
	canvas->LineTo(rect.Left,rect.Top);
}
void __fastcall TTableForm::StringGrid1DrawCell(TObject *Sender, int ACol, int ARow,
          TRect &Rect, TGridDrawState State)
{
	int fixcols=4;
	StringGrid1->Canvas->Brush->Color=clWhite;
	if(ACol<fixcols || ARow<2)StringGrid1->Canvas->Pen->Color=clBlack;
	else{
		StringGrid1->Canvas->Pen->Color=clGray;
		Rect.Top-=1;
		Rect.left-=1;
	}
	StringGrid1->Canvas->Pen->Width=1;
	if(ACol<fixcols || ARow<2)StringGrid1->Canvas->Brush->Color=RGB(240,240,240);
	else if(ACol<fixcols+4 || ACol>=StringGrid1->ColCount-4 || DayOfWeek(month-4-fixcols+ACol)==1 || DayOfWeek(month-4-fixcols+ACol)==7)StringGrid1->Canvas->Brush->Color=RGB(248,248,248);
	if(ARow<2 || StringGrid1->RowCount==3){
		if(ACol<4){
			Rect.Top-=2;
			Rect.left-=2;
		}
		StringGrid1->Canvas->FillRect(Rect);
		if(ACol>=4)drawBorder(StringGrid1->Canvas,Rect);
		tagRECT tr;
		tr.left=Rect.Left+1;tr.right=Rect.Right;tr.top=Rect.Top+1;tr.bottom=Rect.Bottom;
		DrawText(StringGrid1->Canvas->Handle, StringGrid1->Cells[ACol][ARow].w_str(), StringGrid1->Cells[ACol][ARow].Length(), &tr,DT_CENTER);
		return;
    }
	if(cells.size()==0)return;
	Cell *cl=cells[ARow-2]->at(ACol);
	TRect tempRect;
	int width=0,height=0;
	Course *active;
	tagRECT tr;
	switch(cl->cellType){
		case EUsual:
			StringGrid1->Canvas->FillRect(Rect);
			drawBorder(StringGrid1->Canvas,Rect);
			//StringGrid1->Canvas->TextOutW(Rect.Left+1,Rect.Top+1);
		break;
		case ESpan:
			for(int i=ACol;i<ACol+cl->hspan;++i)width+=StringGrid1->ColWidths[i]+1;
			for(int i=ARow;i<ARow+cl->vspan;++i)height+=StringGrid1->RowHeights[i]+1;
			Rect.Right=Rect.Left+width-1;
			Rect.Bottom=Rect.Top+height-1;
			StringGrid1->Canvas->FillRect(Rect);
			drawBorder(StringGrid1->Canvas,Rect);
			tr.left=Rect.Left+2;tr.right=Rect.Right;tr.top=Rect.Top+1;tr.bottom=Rect.Bottom;
			DrawText(StringGrid1->Canvas->Handle, cl->text.w_str(), cl->text.Length(), &tr,cl->flags);
		break;
		case ECourseS:
			Rect.Left+=1;
			Rect.Top+=1;
			for(int i=ACol;i<ACol+cl->hspan;++i)width+=StringGrid1->ColWidths[i]+1;
			for(int i=ARow;i<ARow+cl->vspan;++i)height+=StringGrid1->RowHeights[i]+1;
			Rect.Right=Rect.Left+width-1;
			Rect.Bottom=Rect.Top+height-1;
			if(cl->courseR==0 || (cl->courseP==selectedCourse && selectedCourse!=NULL && showPlan) || !showReal)active=cl->courseP;else active=cl->courseR;
			if(cl->courseR==active)StringGrid1->Canvas->Brush->Color=executedCourseColor;
			else if(cl->courseP!=0)StringGrid1->Canvas->Brush->Color=cl->courseP->program->color;
			if(active==selectedCourse) StringGrid1->Canvas->Pen->Color=clBlue;
			StringGrid1->Canvas->FillRect(Rect);
			if(active==selectedCourse){
				Rect.Right-=1;
				Rect.Bottom-=1;
				drawBorder(StringGrid1->Canvas,Rect);
            }
			String text=IntToStr(active->students);
			if(active->dates.size()>0){
				text+=" ";
				std::vector<ClassRoom*> rooms;
				for(int i=0;i<active->dates.size();++i){
					bool isNotHas=true;
					for(int j=0;j<rooms.size() && isNotHas;++j)
						if(rooms[j]==active->dates[i]->room)
							isNotHas=false;
					rooms.push_back(active->dates[i]->room);
					if(isNotHas)text+=active->dates[i]->room->name+", ";
				}
				text=text.SubString(0,text.Length()-2);
			}
			tr.left=Rect.Left+2;tr.right=Rect.Right;tr.top=Rect.Top+1;tr.bottom=Rect.Bottom;
			DrawText(StringGrid1->Canvas->Handle, text.w_str(), text.Length(), &tr,cl->flags);
		break;

	}
}
//---------------------------------------------------------------------------

ProgTables* TTableForm::getProgTableByRow(int row){
	if(progs.size()>0){
		int headerCount,tempRow=3,istraining=progs[0]->prog->istraining;
		for(int i=0;i<progs.size();++i){
			if(istraining!=progs[i]->prog->istraining){
				istraining=progs[i]->prog->istraining;
				++tempRow;
			}
			if(tempRow==row)return progs[i];
		}
	}
	return NULL;
}
void __fastcall TTableForm::StringGrid1DblClick(TObject *Sender)
{
	int fixcols=4;
	TPoint p;
	p=StringGrid1->ScreenToClient(Mouse->CursorPos);
	int col,row;
	StringGrid1->MouseToCell(p.X,p.Y,col,row);
	if(showAllPrograms==false){
		if(col>=fixcols && (row<3 || (StringGrid1->RowCount==3 && row==3))){
			ccf->prog=NULL;
			ccf->smena=NULL;
			ccf->room=NULL;
			ccf->studentsC=-1;
			ccf->isPlan=ccf->isReal=false;
			if(ccf->ShowModal()==mrOk){
				TDate dd=month-8+col;
				std::vector<DateLesson*> dl;
				for(int i=0;i<ccf->prog->days;++i){
					DateLesson* dll=new DateLesson();
					dll->date=dd+i;dll->room=ccf->room;
					dl.push_back(dll);
                }
				Course *c=new Course(ccf->prog,ccf->smena->first,ccf->smena->second,ccf->studentsC,&dl,"");
				if(ccf->isPlan)App::db->getPlanTable()->createEntity(c);
				else App::db->getRealTable()->createEntity(c);
				for(int i=0;i<ccf->prog->days;++i) delete dl.at(i);
				this->sstringRedraw();
				return;
            }
		}else{

		}
	}
	if(col>=fixcols && row>=3){
		ProgTables *pts=this->getProgTableByRow(row);
		if(pts!=NULL){
			Cell *cell=cells[row-2]->at(col);
			if(cell->courseP!=NULL && cell->courseR ==NULL && showPlan){
				Course *newC=new Course(*cell->courseP);
				App::db->getRealTable()->createEntity(newC);
				pts->real.push_back(newC);
				this->selectedCourse=newC;
				this->regenerateCells(progs);
				this->StringGrid1->Repaint();
				return;
			}
			if(cell->courseP==NULL && cell->courseR ==NULL){
				ccf->prog=pts->prog;
				ccf->smena=new std::pair<TDateTime,TDateTime>(pts->time);
				ccf->room=NULL;
				ccf->studentsC=-1;
				ccf->isPlan=ccf->isReal=false;
				if(ccf->ShowModal()==mrOk){
					TDate dd=month-8+col;
					std::vector<DateLesson*> dl;
					for(int i=0;i<ccf->prog->days;++i){
						DateLesson* dll=new DateLesson();
						dll->date=dd+i;dll->room=ccf->room;
						dl.push_back(dll);
					}
					Course *c=new Course(ccf->prog,ccf->smena->first,ccf->smena->second,ccf->studentsC,&dl,"");
					if(ccf->isPlan)App::db->getPlanTable()->createEntity(c);
					else App::db->getRealTable()->createEntity(c);
					for(int i=0;i<ccf->prog->days;++i) delete dl.at(i);
					this->sstringRedraw();
				}
			}
		}
	}
}
//---------------------------------------------------------------------------

void __fastcall TTableForm::StringGrid1SelectCell(TObject *Sender, int ACol, int ARow,
          bool &CanSelect)
{
	CanSelect=false;
}
//---------------------------------------------------------------------------


void __fastcall TTableForm::StringGrid1Click(TObject *Sender)
{
	/*int fixcols=4;
	TPoint p;
	p=StringGrid1->ScreenToClient(Mouse->CursorPos);
	int col,row;
	StringGrid1->MouseToCell(p.X,p.Y,col,row);
	if(col>=fixcols && (row<3 || (StringGrid1->RowCount==3 && row==3))){
		//�������� ���������� ���� �������� ��������
	}else{
		Cell *cl=cells[row-2]->at(col);
		if(cl->courseR!=NULL && showReal!=false){
			this->selectedCourse=cl->courseR;
		}else if(cl->courseP!=NULL && showPlan!=false){
			this->selectedCourse=cl->courseP;
		}else{
			this->selectedCourse=NULL;
		}
		if(this->dragCell!=NULL)return;
		this->regenerateCells(progs);
		StringGrid1->Repaint();
	}*/

}
//---------------------------------------------------------------------------

void __fastcall TTableForm::CheckBox1Click(TObject *Sender)
{
	showPlan=dynamic_cast<TCheckBox*>(Sender)->Checked;
	this->regenerateCells(progs);
	this->StringGrid1->Repaint();
}
//---------------------------------------------------------------------------

void __fastcall TTableForm::CheckBox2Click(TObject *Sender)
{
	showReal=dynamic_cast<TCheckBox*>(Sender)->Checked;
	this->regenerateCells(progs);
	this->StringGrid1->Repaint();
}
//---------------------------------------------------------------------------

void __fastcall TTableForm::Button3Click(TObject *Sender)
{
	month=IncMonth(month,-1);
	realTable->loadMonth(IncMonth( month, -1 ));
	planTable->loadMonth(IncMonth( month, -1 ));
	this->sstringRedraw();
}
//---------------------------------------------------------------------------

void __fastcall TTableForm::Button2Click(TObject *Sender)
{
	month=IncMonth(month,1);
	realTable->loadMonth(IncMonth( month, 1 ));
	planTable->loadMonth(IncMonth( month, 1 ));
	this->sstringRedraw();
}
//---------------------------------------------------------------------------

void __fastcall TTableForm::CheckBox3Click(TObject *Sender)
{
	showAllPrograms=!dynamic_cast<TCheckBox*>(Sender)->Checked;
	this->sstringRedraw();
}
//---------------------------------------------------------------------------

void __fastcall TTableForm::StringGrid1MouseDown(TObject *Sender, TMouseButton Button,
          TShiftState Shift, int X, int Y)
{
	int col,row;
	StringGrid1->MouseToCell(X,Y,col,row);
	itscc=col;
	itscr=row;
	dragCell=NULL;
	if(col>3 && row>2){
		dragCell=cells[row-2]->at(col);
		dragRow=cells[row-2];
		this->Caption=IntToStr(row-2)+" "+IntToStr(col);
		if(dragCell->courseP!=NULL || dragCell->courseR!=NULL)StringGrid1->BeginDrag(False, 4);
	}
}
//---------------------------------------------------------------------------

void __fastcall TTableForm::StringGrid1DragOver(TObject *Sender, TObject *Source,
          int X, int Y, TDragState State, bool &Accept)
{
	int col,row;
	StringGrid1->MouseToCell(X, Y, col, row);
	Accept = col>3 && row>2;
}
//---------------------------------------------------------------------------
void TTableForm::moveCourseFromTo(Course *course,std::vector<Cell*>* dragRow,Cell *from,Cell *to){
	Course *newC;
	TDateTime dt,dt2;
	if(course==from->courseP){
		int src,dest;
		for(int i=0;i<dragRow->size();++i){
			if(dragRow->at(i)==from)src=i;
			if(dragRow->at(i)==to)dest=i;
		}
		dt=from->lessonP->date+dest-src;
		dt2=from->lessonP->date;
		from->courseP=NULL;
		from->lessonP=NULL;
	}
	if(course==from->courseR){
		int src,dest;
		for(int i=0;i<dragRow->size();++i){
			if(dragRow->at(i)==from)src=i;
			if(dragRow->at(i)==to)dest=i;
		}
		dt=from->lessonR->date+dest-src;
		dt2=from->lessonR->date;
		from->courseR=NULL;
		from->lessonR=NULL;
	}
	newC=new Course(*course);
	for(int i=0;i<newC->dates.size();++i){
		if(newC->dates[i]->date==dt2){
			newC->dates[i]->date=dt;
			break;
		}
	}
	course->updateEntity(newC);
}
void __fastcall TTableForm::StringGrid1DragDrop(TObject *Sender, TObject *Source,
          int X, int Y)
{
	int col,row;
	StringGrid1->MouseToCell(X, Y, col, row);
	if(dragCell->courseP==selectedCourse && selectedCourse!=NULL && showPlan){
		moveCourseFromTo(dragCell->courseP,dragRow,dragCell,dragRow->at(col));
		goto exxit;
	}
	if(dragCell->courseR==selectedCourse && selectedCourse!=NULL && showReal){
		moveCourseFromTo(dragCell->courseR,dragRow,dragCell,dragRow->at(col));
		goto exxit;
	}
	if(dragCell->courseP!=NULL && dragCell->courseR==NULL && showPlan){
		moveCourseFromTo(dragCell->courseP,dragRow,dragCell,dragRow->at(col));
		goto exxit;
	}
	if(dragCell->courseR!=NULL && dragCell->courseP==NULL && showReal){
		moveCourseFromTo(dragCell->courseR,dragRow,dragCell,dragRow->at(col));
		goto exxit;
	}
	if(dragCell->courseR!=NULL && dragCell->courseP!=NULL && showReal){
		moveCourseFromTo(dragCell->courseR,dragRow,dragCell,dragRow->at(col));
		goto exxit;
	}
	if(dragCell->courseP!=NULL && !showReal && showPlan){
		moveCourseFromTo(dragCell->courseP,dragRow,dragCell,dragRow->at(col));
		goto exxit;
	}
	if(dragCell->courseR==NULL && dragCell->courseP!=NULL && showPlan){
		moveCourseFromTo(dragCell->courseP,dragRow,dragCell,dragRow->at(col));
		goto exxit;
	}
exxit:
	dragCell=NULL;
	this->regenerateCells(progs);
	StringGrid1->Repaint();
}
//---------------------------------------------------------------------------



void __fastcall TTableForm::StringGrid1MouseUp(TObject *Sender, TMouseButton Button,
          TShiftState Shift, int X, int Y)
{
	int fixcols=4;
	TPoint p;
	p=StringGrid1->ScreenToClient(Mouse->CursorPos);
	int col,row;
	StringGrid1->MouseToCell(p.X,p.Y,col,row);
	if(col==itscc && row==itscr){

		if(col>=fixcols && (row<3 || (StringGrid1->RowCount==3 && row==3))){
			//�������� ���������� ���� �������� ��������
		}else{
			Cell *cl=cells[row-2]->at(col);
			if(cl->courseR!=NULL && showReal!=false){
				this->selectedCourse=cl->courseR;
			}else if(cl->courseP!=NULL && showPlan!=false){
				this->selectedCourse=cl->courseP;
			}else{
				this->selectedCourse=NULL;
			}
			//if(this->dragCell!=NULL)return;
			this->regenerateCells(progs);
			StringGrid1->Repaint();
		}
	}
}
//---------------------------------------------------------------------------
