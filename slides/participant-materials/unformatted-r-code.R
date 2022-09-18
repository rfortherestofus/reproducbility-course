library(tidyverse)
library(haven)
library(table1)
library(finalfit)
library(knitr)
library(xfun)
globalData2019<-read_spss("Pew Research Center Global Attitudes Spring 2019 Dataset WEB.sav")
globalData2019clean<-globalData2019%>%filter(country%in%c(16,21,26,30))%>%select(country,SEX,AGE,BETTER_GENDER,COUNTRY_SATIS,ECON_SIT,LADDER_NOW)%>%zap_labels()%>%
mutate(AGE=na_if(AGE,98))%>%mutate(AGE=na_if(AGE,99))%>%mutate(LADDER_NOW=na_if(LADDER_NOW,98))%>%
mutate(LADDER_NOW=na_if(LADDER_NOW,99))%>%mutate(country=recode_factor(country,'16'='Kenya','21'='Nigeria','26'='South Africa','30'='Tunisia'))%>%
mutate(SEX=recode_factor(SEX,'1'='Male','2'='Female'))%>%mutate(BETTER_GENDER=recode_factor(BETTER_GENDER,'1'='Men','2'='Women','3'='Same/both equally','8'=NA_character_,'9'=NA_character_))%>%
mutate(COUNTRY_SATIS=recode_factor(COUNTRY_SATIS,'1'='Satisfied','2'='Dissatisfied','8'=NA_character_,'9'=NA_character_))%>%
mutate(ECON_SIT=recode_factor(ECON_SIT,'1'='Very good','2'='Somewhat good','3'='Somewhat bad','4'='Very bad','8'=NA_character_,'9'=NA_character_))
summary(globalData2019clean)
label(globalData2019clean$country)<-"Country"
label(globalData2019clean$SEX)<-"Sex"
label(globalData2019clean$AGE)<-"Age" 
label(globalData2019clean$BETTER_GENDER)<-"Who has a better life in this country"
label(globalData2019clean$COUNTRY_SATIS)<-"Satisfied/dissatisfied with country"
label(globalData2019clean$ECON_SIT)<-"Describe economic situation country" 
label(globalData2019clean$LADDER_NOW)<-"Worst (0) to best (10) life"
tableDesc<-globalData2019clean%>%summary_factorlist(explanatory=c('SEX', 'BETTER_GENDER','COUNTRY_SATIS','ECON_SIT','AGE','LADDER_NOW'),cont="median")
kable(tableDesc,row.names=FALSE,col.names=c("Characteristic","Category","n (%)"),align=c("l","l","r"))
globalData2019clean%>%ggplot(aes(x=AGE))+geom_histogram()+facet_wrap(facets=vars(country))+labs(x="Age in years",caption="Data source: Pew Research Center Global Attitudes Survey (2019)")+theme_bw(base_size=10,base_family="serif")
globalData2019clean%>%ggplot(aes(x=LADDER_NOW))+geom_histogram()+facet_wrap(facets=vars(country))+labs(x="Life ladder (0=worst,10=best)",caption="Data source: Pew Research Center Global Attitudes Survey (2019)")+theme_bw(base_size=10,base_family="serif") 
globalData2019clean%>%group_by(COUNTRY_SATIS,country)%>%count()%>%group_by(country)%>%mutate(perc=100*(n/sum(n)))%>%drop_na(COUNTRY_SATIS)%>%ggplot(aes(x=country,y=perc,fill=COUNTRY_SATIS))+geom_col(position="dodge")+labs(x="Country",
y="Percentage within country",fill="Satisfaction with\nhow things\nare going")+theme_bw(base_size=10,base_family="serif")+scale_fill_grey()
globalData2019clean%>%ggplot(aes(y=LADDER_NOW,x=country))+geom_boxplot(fill='grey40',alpha=.4)+labs(x="Country",y="Life ladder (0=worst,10=best)")+theme_bw(base_size=10,base_family="serif") 
globalData2019clean%>%group_by(BETTER_GENDER,country)%>%count()%>%group_by(country)%>%mutate(perc=100*(n/sum(n)))%>%drop_na(BETTER_GENDER)%>%ggplot(aes(x=country,y=perc,fill=BETTER_GENDER))+geom_col(position="dodge")+
labs(x="Survey participant country",y="Percent within country",fill="Who has a better life")+theme_bw(base_size=10,base_family="serif")+scale_fill_grey()