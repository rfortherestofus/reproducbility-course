library(tidyverse)
library(haven)
library(finalfit)
library(table1)
library(knitr)
globalData2019<-read_spss("Pew Research Center Global Attitudes Spring 2019 Dataset WEB.sav")
globalData2019samp<-sample_n(globalData2019,10000)
globalData2019clean<-globalData2019samp%>%filter(country%in%c(3,15,19,21,34))%>%select(country,FUTURE_CULTURE,FUTURE_GAP,FUTURE_JOBS,FUTURE_EDUCATION)%>%zap_labels()%>%mutate(country=recode_factor(country,'3'='Brazil','15'='Japan','19'='Mexico','21'='Nigeria','34'='United States'))%>%
mutate(FUTURE_CULTURE=recode_factor(FUTURE_CULTURE,'1'='Optimistic','2'='Pessimistic','3'='Neither','8'=NA_character_,'9'=NA_character_))%>%mutate(FUTURE_EDUCATION=recode_factor(FUTURE_EDUCATION,'1'='Optimistic','2'='Pessimistic','3'='Neither','8'=NA_character_,'9'=NA_character_))%>%
mutate(FUTURE_GAP=recode_factor(FUTURE_GAP,'1'='Optimistic','2'='Pessimistic','3'='Neither','8'=NA_character_,'9'=NA_character_))%>%mutate(FUTURE_JOBS=recode_factor(FUTURE_JOBS,'1'='Optimistic','2'='Pessimistic','3'='Neither','8'=NA_character_,'9'=NA_character_))
summary(object = globalData2019clean)
label(globalData2019clean$country)<-"Country"
label(globalData2019clean$FUTURE_CULTURE)<-"Our country’s culture"
label(globalData2019clean$FUTURE_GAP)<-"Reducing the gap between the rich and poor"
label(globalData2019clean$FUTURE_JOBS)<-"The availability of well-paying jobs"
label(globalData2019clean$FUTURE_EDUCATION)<-"Our country’s education system"
tableDesc<-globalData2019clean%>%summary_factorlist(explanatory=c("FUTURE_CULTURE","FUTURE_GAP","FUTURE_EDUCATION","FUTURE_JOBS"))
kable(tableDesc,row.names=FALSE,col.names=c("Area","Optimism","n (%)"),align = c("l", "l", "r"),hline = 'linesep')
globalData2019clean%>%drop_na(FUTURE_CULTURE)%>%group_by(country,FUTURE_CULTURE)%>%count()%>%group_by(country)%>%mutate(percent=100*(n/sum(n)))%>%drop_na()%>%filter(FUTURE_CULTURE=="Optimistic")%>%ggplot()+geom_col(aes(x = country, y = percent, fill = country))+labs(x="Country",y="Percent optimistic within country")+scale_fill_brewer(palette="Set2",guide=NULL)+ylim(0,100)+theme_minimal(base_size=16)+scale_x_discrete(labels=function(x) str_wrap(x,width=10))  
globalData2019clean%>%drop_na(FUTURE_EDUCATION)%>%group_by(country,FUTURE_EDUCATION)%>%count()%>%group_by(country)%>%mutate(percent=100*(n/sum(n)))%>%drop_na()%>%filter(FUTURE_EDUCATION=="Optimistic")%>%ggplot()+geom_col(aes(x = country, y = percent, fill = country))+labs(x="Country",y="Percent optimistic within country")+scale_fill_brewer(palette="Set2",guide=NULL)+ylim(0,100)+theme_minimal(base_size=16)+scale_x_discrete(labels=function(x) str_wrap(x,width=10))  
globalData2019clean%>%drop_na(FUTURE_JOBS)%>%group_by(country,FUTURE_JOBS)%>%count()%>%group_by(country)%>%mutate(percent=100*(n/sum(n)))%>%drop_na()%>%filter(FUTURE_JOBS=="Optimistic")%>%ggplot()+geom_col(aes(x = country, y = percent, fill = country))+labs(x="Country",y="Percent optimistic within country")+scale_fill_brewer(palette="Set2",guide=NULL)+ylim(0,100)+theme_minimal(base_size=16)+scale_x_discrete(labels=function(x) str_wrap(x,width=10))  
globalData2019clean%>%drop_na(FUTURE_GAP)%>%group_by(country,FUTURE_GAP)%>%count()%>%group_by(country)%>%mutate(percent=100*(n/sum(n)))%>%drop_na()%>%filter(FUTURE_GAP=="Optimistic")%>%ggplot()+geom_col(aes(x = country, y = percent, fill = country))+labs(x="Country",y="Percent optimistic within country")+scale_fill_brewer(palette="Set2",guide=NULL)+ylim(0,100)+theme_minimal(base_size=16)+scale_x_discrete(labels=function(x) str_wrap(x,width=10))  
