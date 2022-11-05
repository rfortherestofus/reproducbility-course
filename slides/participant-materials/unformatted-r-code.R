library(tidyverse)
library(haven)
library(table1)
library(finalfit)
library(knitr)
library(xfun)
globalData2019<-read_spss("Pew Research Center Global Attitudes Spring 2019 Dataset WEB.sav")
globalData2019samp <- sample_n(globalData2019,200)
globalData2019clean<-globalData2019samp%>%select(country,SEX,AGE,BETTER_GENDER,COUNTRY_SATIS,ECON_SIT,LADDER_NOW,POLICY_CLIMATE,POLICY_THEWALL,POLICY_NUCLEAR,POLICY_IMMIG,POLICY_TARRIF,POLICY_NORTHKOREA,POLICY_EMBASSY)%>%zap_labels()%>%
mutate(AGE=na_if(AGE,98))%>%mutate(AGE=na_if(AGE,99))%>%mutate(LADDER_NOW=na_if(LADDER_NOW,98))%>%
mutate(LADDER_NOW=na_if(LADDER_NOW,99))%>%mutate(country=recode_factor(country,'16'='Kenya','21'='Nigeria','26'='South Africa','30'='Tunisia'))%>%
mutate(SEX=recode_factor(SEX,'1'='Male','2'='Female'))%>%mutate(BETTER_GENDER=recode_factor(BETTER_GENDER,'1'='Men','2'='Women','3'='Same/both equally','8'=NA_character_,'9'=NA_character_))%>%
mutate(POLICY_CLIMATE=recode_factor(POLICY_CLIMATE,'1'='Approve','2'='Disapprove','8'=NA_character_,'9'=NA_character_))%>%
mutate(POLICY_THEWALL=recode_factor(POLICY_THEWALL,'1'='Approve','2'='Disapprove','8'=NA_character_,'9'=NA_character_))%>%
mutate(POLICY_NUCLEAR=recode_factor(POLICY_NUCLEAR,'1'='Approve','2'='Disapprove','8'=NA_character_,'9'=NA_character_))%>%
mutate(POLICY_IMMIG=recode_factor(POLICY_IMMIG,'1'='Approve','2'='Disapprove','8'=NA_character_,'9'=NA_character_))%>%
mutate(POLICY_TARIFF=recode_factor(POLICY_TARRIF,'1'='Approve','2'='Disapprove','8'=NA_character_,'9'=NA_character_))%>%
mutate(POLICY_NORTHKOREA=recode_factor(POLICY_NORTHKOREA,'1'='Approve','2'='Disapprove','8'=NA_character_,'9'=NA_character_))%>%
mutate(POLICY_EMBASSY=recode_factor(POLICY_EMBASSY,'1'='Approve','2'='Disapprove','8'=NA_character_,'9'=NA_character_))%>%summary(globalData2019clean)
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