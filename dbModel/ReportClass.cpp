//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ReportClass.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
//---------------------------------------------------------------------------
String months[]={"������","�������","����","������","���","����","����","������","��������","�������","������","�������"};
bool isIntoPeriod(TDate date,TDate sdate, TDate edate){
	unsigned short syear,eyear, smonth,emonth,sday,eday;
	unsigned short cyear,cmonth,cday;
	date.DecodeDate(&cyear,&cmonth,&cday);
	sdate.DecodeDate(&syear,&smonth,&sday);
	edate.DecodeDate(&eyear,&emonth,&eday);
	sdate=EncodeDate(syear,smonth,sday);
	edate=EncodeDate(eyear,emonth,eday);
	date=EncodeDate(cyear,cmonth,cday);
	if(date>=sdate && date<=edate) return true;
	return false;
}
int dateDayDiff(TDate first,TDate second){
	unsigned short year,month,day;
	first.DecodeDate(&year,&month,&day);
	first=TDate(year,month,day);
	second.DecodeDate(&year,&month,&day);
	second=TDate(year,month,day);
	return abs((int)(second-first));
}
int getDayOfDate(TDate date){
	unsigned short year,month,day;
	date.DecodeDate(&year,&month,&day);
	return day;
}
int getMonthOfDate(TDate date){
	unsigned short year,month,day;
	date.DecodeDate(&year,&month,&day);
	return month;
}
int getYearOfDate(TDate date){
	unsigned short year,month,day;
	date.DecodeDate(&year,&month,&day);
	return year;
}
struct sortRoomsEntityUser{
	bool operator()(ClassRoom *a,ClassRoom *b){
		ClassRoom *cr1=dynamic_cast<ClassRoom*>(a);
		ClassRoom *cr2=dynamic_cast<ClassRoom*>(b);
		if(cr1->isrent!=cr2->isrent){
			return cr1->isrent>cr2->isrent;
		}else return cr1->name<cr2->name;
	}
};
struct sortProgramsEntityUser{
	bool operator()(Program *a,Program *b){
		Program *cr1=dynamic_cast<Program*>(a);
		Program *cr2=dynamic_cast<Program*>(b);
		if(cr1->isactual!=cr2->isactual){
			return cr1->isactual>cr2->isactual;
		}else if(cr1->istraining!=cr2->istraining){
			return cr1->istraining>cr2->istraining;
		}else if(cr1->key!=cr2->key){
			return cr1->key<cr2->key;
		}else return cr1->name<cr2->name;
	}
};

TReportClass::ExcelCell::ExcelCell(){
	init("",ExcelCellType::EXEmpty,NULL,1,1,ExcelHAlign::Left,ExcelVAlign::Top,16777215,14277081);
}
void TReportClass::ExcelCell::setSpan(String text,int hspan,int vspan,ExcelHAlign halign,ExcelVAlign valign,unsigned fillColor,unsigned borderColor){
	init(text,ExcelCellType::EXSpan,NULL,hspan,vspan,halign,valign,fillColor,borderColor);
}
void TReportClass::ExcelCell::init(String text,ExcelCellType type,Course *course,int hspan,int vspan, ExcelHAlign halign,ExcelVAlign valign,unsigned fillColor,unsigned borderColor){
	this->text=text;
	this->type=type;
	this->course=course;
	this->hspan=hspan;
	this->vspan=vspan;
	this->halign=halign;
	this->valign=valign;
	this->fillColor=fillColor;
	this->borderColor=borderColor;
}
TReportClass::ExcelRow::ExcelRow():std::vector<ExcelCell*>(){}
TReportClass::ExcelRow::ExcelRow(int length):std::vector<ExcelCell*>(length){
	for(int i=0;i<length;++i)this->at(i)=new ExcelCell();
}
TReportClass::ExcelPage::~ExcelPage(){
	for(int i=0;i<rows.size();++i) delete rows[i];
}
TReportClass::ExcelRow::~ExcelRow(){
	for(int j=0;j<this->size();++j)delete this->at(j);
}
TReportClass::DateRoom::operator <(const DateRoom &ps)const{
	if(this->room==ps.room){
		return this->date<ps.date;
	}else return this->room<ps.room;
}
TReportClass::DateRoom::operator ==(const DateRoom &ps)const {
	return this->date==ps.date && this->room==ps.room;
}

__fastcall TReportClass::TReportClass(TComponent* Owner)
	: TForm(Owner)
{
	showReal=showPlan=true;
	this->ComboBox1->Items->Add("1");
	this->ComboBox1->Items->Add("2");
	this->ComboBox1->Items->Add("3");
	this->ComboBox1->Items->Add("4");
	this->ComboBox1->Items->Add("5");
	this->ComboBox1->Items->Add("6");
	this->ComboBox1->Items->Add("7");
	this->ComboBox1->Items->Add("8");
	this->ComboBox1->Items->Add("9");
	this->ComboBox1->Items->Add("10");
	this->ComboBox1->Items->Add("11");
	this->ComboBox1->Items->Add("12");
	this->ComboBox2->Items->Add("1");
	this->ComboBox2->Items->Add("2");
	this->ComboBox2->Items->Add("3");
	this->ComboBox2->Items->Add("4");
	this->ComboBox2->Items->Add("5");
	this->ComboBox2->Items->Add("6");
	this->ComboBox2->Items->Add("7");
	this->ComboBox2->Items->Add("8");
	this->ComboBox2->Items->Add("9");
	this->ComboBox2->Items->Add("10");
	this->ComboBox2->Items->Add("11");
	this->ComboBox2->Items->Add("12");
}
//---------------------------------------------------------------------------
void TReportClass::startEndToForm(){
	unsigned short year,day,month;
	start.DecodeDate(&year,&month,&day);
	Edit1->Text=IntToStr(year);
	ComboBox1->ItemIndex=month-1;
	end.DecodeDate(&year,&month,&day);
	ComboBox2->ItemIndex=month-1;
}
void TReportClass::startEndFromForm(){
	unsigned short year,day,month;
	year=StrToInt(Edit1->Text);
	month=ComboBox1->ItemIndex+1;
	start=EncodeDate(year,month,1);
	month=ComboBox2->ItemIndex+1;
	end=EncodeDate(year,month,1);
}

void TReportClass::clearExcelLayer(){
	for(int i=0;i<excelLayer.size();++i)delete excelLayer[i];
	excelLayer.clear();
}

void TReportClass::clearGroupLayer(){
	std::map<DateRoom,std::pair<std::vector<Course*>*,std::vector<Course*>*>*>::iterator it;
	for(it=groupLayer.begin();it!=groupLayer.end();++it){
		delete it->second->first;
		delete it->second->second;
		delete it->second;
	}
	groupLayer.clear();
}

void __fastcall TReportClass::Button1Click(TObject *Sender)
{
	this->showPlan=CheckBox1->Checked;
	this->showReal=CheckBox2->Checked;
	CourseTable *plan,*real;
	real=App::db->getRealTable();
	plan=App::db->getPlanTable();
	clearExcelLayer();
	clearGroupLayer();
	startEndFromForm();
	unsigned short year,startm,endm;
	{
		unsigned short day;
		start.DecodeDate(&year,&startm,&day);
		end.DecodeDate(&year,&endm,&day);
		if(endm-startm<0)return;
	}
	//Gather data
	std::set<ClassRoom*,sortRoomsEntityUser> usedRooms;
	DateRoom dr;
	TDate endd=IncMonth(end,1)-1.0;
	for(int i=0;i<plan->size()&&showPlan;++i){
		Course *cr=dynamic_cast<Course*>(plan->at(i));
		for(int j=0;j<cr->dates.size();++j){
			if(isIntoPeriod(cr->dates[j]->date,start,endd)){
				dr.date=cr->dates[j]->date;
				dr.room=cr->dates[j]->room;
				usedRooms.insert(dr.room);
				if(groupLayer.count(dr)<1){
					groupLayer[dr]=new std::pair<std::vector<Course*>*,std::vector<Course*>*>();
					groupLayer[dr]->first=new std::vector<Course*>();
					groupLayer[dr]->second=new std::vector<Course*>();
				}
				groupLayer[dr]->second->push_back(cr);
			}
        }
	}
	for(int i=0;i<real->size()&&showReal;++i){
		Course *cr=dynamic_cast<Course*>(real->at(i));
		for(int j=0;j<cr->dates.size();++j){
			if(isIntoPeriod(cr->dates[j]->date,start,endd)){
				dr.date=cr->dates[j]->date;
				dr.room=cr->dates[j]->room;
				usedRooms.insert(dr.room);
				if(groupLayer.count(dr)<1){
					groupLayer[dr]=new std::pair<std::vector<Course*>*,std::vector<Course*>*>();
					groupLayer[dr]->first=new std::vector<Course*>();
					groupLayer[dr]->second=new std::vector<Course*>();
				}
				groupLayer[dr]->first->push_back(cr);
			}
        }
	}
	Rooms *rooms=App::db->getRooms();
	for(int i=0;i<rooms->size();++i)if(((ClassRoom*)rooms->at(i))->isactual)usedRooms.insert((ClassRoom*)rooms->at(i));
	// excel layer creating
	std::vector<std::set<Program*,sortProgramsEntityUser>*> usedPP(endm-startm+1);
	excelLayer.resize(endm-startm+1);
	Course *newCr,*oldCr;
	int oldC;
	for(int i=0;i<excelLayer.size();++i){
		excelLayer[i]=new ExcelPage();
		usedPP[i]=new std::set<Program*,sortProgramsEntityUser>();
		TDate tdate=IncMonth(start,i);
		int dayCount=getDayOfDate(IncMonth(tdate,1)-1.0);
		for(std::set<ClassRoom*,sortRoomsEntityUser>::iterator it=usedRooms.begin();it!=usedRooms.end();++it){
			ExcelRow *exr=new ExcelRow(dayCount+1);
			exr->room=*it;
			oldC=-1;
			newCr=oldCr=NULL;
			dr.room=exr->room;
			exr->at(0)->setSpan(dr.room->name,1,1,ExcelHAlign::Center,ExcelVAlign::Middle,dr.room->isrent ? RGB(252,213,180) : 16777215);
			for(int j=0;j<dayCount;++j){
				newCr=NULL;
				dr.date=tdate+j;
				if(groupLayer.count(dr)>0){
					std::pair<std::vector<Course*>*,std::vector<Course*>*>* dayCourses=groupLayer[dr];
					if(showReal && dayCourses->first->size()>0){
						int maxCrInd=0;
						for(int crInd=1;crInd<dayCourses->first->size();++crInd){
							if(dayCourses->first->at(crInd)->dates.size()>dayCourses->first->at(maxCrInd)->dates.size())
								maxCrInd=crInd;
						}
						newCr=dayCourses->first->at(maxCrInd);
					}else if(showPlan && dayCourses->second->size()>0){
						int maxCrInd=0;
						for(int crInd=1;crInd<dayCourses->second->size();++crInd){
							if(dayCourses->second->at(crInd)->dates.size()>dayCourses->second->at(maxCrInd)->dates.size())
								maxCrInd=crInd;
						}
						newCr=dayCourses->second->at(maxCrInd);
                    }
				}
				if(newCr==NULL){
					oldCr=NULL;
					continue;
				}
				if(newCr==oldCr){
					exr->at(oldC)->hspan+=1;
				}else{
					oldCr=newCr;
					bool isReal=dynamic_cast<PlanTable*>(newCr->getParent())==0;
					if(!isReal)usedPP[i]->insert(newCr->program);
					exr->at(j+1)->setSpan(IntToStr(newCr->students)+"/"+newCr->program->key,1,1,ExcelHAlign::Center,ExcelVAlign::Middle,isReal ? 14277081 : newCr->program->color);
					oldC=j+1;
				}
			}
			excelLayer[i]->rows.push_back(exr);
		}
		if(usedPP[i]->size()>0){
			excelLayer[i]->rows.push_back(new ExcelRow(dayCount+1));
			for(std::set<Program*,sortProgramsEntityUser>::iterator it=usedPP[i]->begin();it!=usedPP[i]->end();++it){
				ExcelRow *exr=new ExcelRow(dayCount+1);
				exr->at(0)->setSpan("",1,1,ExcelHAlign::Center,ExcelVAlign::Middle,(*it)->color,0);
				exr->at(1)->setSpan((*it)->name,1,1,ExcelHAlign::Left,ExcelVAlign::Middle);
				excelLayer[i]->rows.push_back(exr);
			}
		}
	}
	for(int i=0;i<usedPP.size();++i)delete usedPP[i];
	excelLayerToBook();
}
//---------------------------------------------------------------------------
void TReportClass::excelPageToVariant(ExcelPage *page,Variant &var){
	var=VarArrayCreate(OPENARRAY(int, (1, page->rows.size(), 1, page->rows[0]->size())), varVariant);
	for(int i=0;i<page->rows.size();++i){
		ExcelRow *eRow=page->rows[i];
		for(int j=0;j<eRow->size();++j){
			if(eRow->at(j)->type!=ExcelCellType::EXEmpty){
				var.PutElement(WideString(eRow->at(j)->text),i+1,j+1);
			}
		}
	}
}
inline void StWeightB(Variant &border){
	border.OlePropertySet("LineStyle",1);
	border.OlePropertySet("Weight",2);
}
inline void drawAllBorders(Variant &range){
	Variant border=range.OlePropertyGet("Borders",7);
	StWeightB(border);
	border=range.OlePropertyGet("Borders",8);
	StWeightB(border);
	border=range.OlePropertyGet("Borders",10);
	StWeightB(border);
	border=range.OlePropertyGet("Borders",9);
	StWeightB(border);
	border=range.OlePropertyGet("Borders",11);
	StWeightB(border);
	border=range.OlePropertyGet("Borders",12);
	StWeightB(border);
}
void TReportClass::excelLayerToBook(){
	Variant EApp, EBook, ESheet;
	EApp = CreateOleObject("Excel.Application");
	//EApp.OlePropertySet("Visible",true);
	String pathToBook=App::progFolder+"scheduleS.xlsx";
	EBook=EApp.OlePropertyGet("Workbooks").OleFunction(L"Open",WideString(pathToBook.c_str()),0,true);
	ESheet=EBook.OlePropertyGet("ActiveSheet");
	int smonth=getMonthOfDate(start)-1;
	for(int i=1;i<excelLayer.size();++i) ESheet.OleProcedure("Copy",ESheet);
	{
		Variant ESheets=EBook.OlePropertyGet("Worksheets");
		for(int i=0;i<excelLayer.size();++i){
			ESheet=ESheets.OlePropertyGet("Item",i+1);
			ESheet.OlePropertySet("Name",WideString(months[smonth+i].w_str()));
			ESheet.OlePropertyGet("Cells").OlePropertyGet("Item",1,1).OlePropertySet("Value",WideString(months[smonth+i].UpperCase().w_str()));
			for(int j=31;j>=MonthDays[IsLeapYear(getYearOfDate(start))][smonth+i];--j)
				ESheet.OlePropertyGet("Columns").OlePropertyGet("Item",2+j).OleProcedure("Delete");
		}
	}
	for(int i=0;i<excelLayer.size();++i){
		ESheet=EBook.OlePropertyGet("Worksheets").OlePropertyGet("Item",i+1);
		Variant range;
		excelPageToVariant(excelLayer[i],range);
		Variant ERange=ESheet.OlePropertyGet("Range",ESheet.OlePropertyGet("Cells").OlePropertyGet("Item",4,1),ESheet.OlePropertyGet("Cells").OlePropertyGet("Item",4+excelLayer[i]->rows.size()-1,excelLayer[i]->rows[0]->size()));
		ERange.OlePropertySet("Value",range);
		TDate curDay=EncodeDate(getYearOfDate(start),smonth+i+1,1);
		int dayCount=MonthDays[IsLeapYear(getYearOfDate(start))][smonth+i];
		int rowTT;
		for(rowTT=1;rowTT<excelLayer[i]->rows.size();++rowTT)
			if(excelLayer[i]->rows[rowTT]->room==NULL)
				break;
		for(int j=0;j<dayCount;++j){
			int dOW=DayOfWeek(curDay+j);
			if(dOW==7){
				if(j+1<dayCount)ERange=ESheet.OlePropertyGet("Range",ESheet.OlePropertyGet("Cells").OlePropertyGet("Item",3,2+j),ESheet.OlePropertyGet("Cells").OlePropertyGet("Item",3+rowTT,3+j));
				else ERange=ESheet.OlePropertyGet("Range",ESheet.OlePropertyGet("Cells").OlePropertyGet("Item",3,2+j),ESheet.OlePropertyGet("Cells").OlePropertyGet("Item",3+rowTT,2+j));
				ERange.OlePropertyGet("Interior").OlePropertySet("Color",RGB(255,255,153));
				++j;
			}else if(dOW==1){
				ERange=ESheet.OlePropertyGet("Range",ESheet.OlePropertyGet("Cells").OlePropertyGet("Item",3,2+j),ESheet.OlePropertyGet("Cells").OlePropertyGet("Item",3+rowTT,3+j));
				ERange.OlePropertyGet("Interior").OlePropertySet("Color",RGB(255,255,153));
			}
		}
		excelPageToSheet(excelLayer[i],ESheet);
		ERange=ESheet.OlePropertyGet("Range",ESheet.OlePropertyGet("Cells").OlePropertyGet("Item",1,1),ESheet.OlePropertyGet("Cells").OlePropertyGet("Item",3+rowTT,excelLayer[i]->rows[0]->size()));
        drawAllBorders(ERange);
	}
	EBook.OlePropertyGet("Worksheets").OlePropertyGet("Item",1).OleProcedure("Activate");
	EApp.OlePropertySet("Visible",true);
}
void TReportClass::excelPageToSheet(ExcelPage *ep,Variant &sheet){
	Variant eRange;
	for(int i=0;i<ep->rows.size();++i){
		ExcelRow *eRow=ep->rows[i];
		for(int j=0;j<eRow->size();++j){
			ExcelCell *cell=eRow->at(j);
			if(eRow->at(j)->type!=ExcelCellType::EXEmpty){
				if(cell->fillColor!=16777215){
					sheet.OlePropertyGet("Cells").OlePropertyGet("Item",4+i,j+1).OlePropertyGet("Interior").OlePropertySet("Color",cell->fillColor);
				}
				if(cell->hspan!=1 || cell->vspan!=1){
					eRange=sheet.OlePropertyGet("Range",sheet.OlePropertyGet("Cells").OlePropertyGet("Item",4+i,j+1),sheet.OlePropertyGet("Cells").OlePropertyGet("Item",3+i+cell->vspan,j+cell->hspan));
					eRange.OleProcedure("Merge");
				}
				if(cell->halign!=ExcelHAlign::Center){
					sheet.OlePropertyGet("Cells").OlePropertyGet("Item",4+i,j+1).OlePropertySet("HorizontalAlignment",cell->halign);
				}
				if(cell->borderColor!=14277081){
					Variant g=sheet.OlePropertyGet("Cells").OlePropertyGet("Item",4+i,j+1);
					drawAllBorders(g);
                }
			}
		}
	}
}
void __fastcall TReportClass::FormShow(TObject *Sender)
{
	unsigned short year,month,day;
	TDate::CurrentDate().DecodeDate(&year,&month,&day);
	start=EncodeDate(year,1,1);
	end=EncodeDate(year,month,1);
	this->startEndToForm();
}
//---------------------------------------------------------------------------

