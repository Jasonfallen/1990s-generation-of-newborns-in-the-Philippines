#### Preamble ####
# Purpose: Clean the survey data downloaded from [https://dhsprogram.com/search/index.cfm?_srchd=1&bydoctype=publication&bypubtype=26%2C5%2C39%2C30%2C21%2C100&byyear=1999&byyear=1998&byyear=1997&byyear=1996&byyear=1995&byyear=1994&byyear=1993&byyear=1992&byyear=1991&byyear=1990&byyear=1989&byyear=1988&byyear=1987&bylanguage=2]
# Author: Haocheng Xu, Jing Li, Wenxuan Li
# Data: 08 April, 2021
# Contact: haocheng.xu@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the ACS data and saved it to inputs/data
# - Don't forget to gitignore it!


#### Workspace setup ####

library(janitor)
library(pdftools)
library(purrr)
library(tidyverse)
library(stringi)
library(plyr)
page<-read.csv("D:\\Work\\part-time_work\\4.2\\project\\output\\data\\raw_data.csv")
page<-page[31:61,]
page<-str_replace_all(page,",",".")
part1<-page[2:7]
part2<-page[8:18]
part3<-page[20:30]
private_doctor<-c()
private_midwife<-c()
family_planning_field_worker<-c()
village_official<-c()
religious_leader<-c()
PKK<-c()
pharmacist<-c()
teacher<-c()
television<-c()
radio<-c()
number_of_women<-c()
for(i in part1){
  part1_number<-str_extract_all(i,"([1-9]\\d*\\.?\\d*)|(0\\.\\d*[1-9])",simplify = T)
  private_doctor<-append(private_doctor,part1_number[2])
  private_midwife<-append(private_midwife,part1_number[3])
  family_planning_field_worker<-append(family_planning_field_worker,part1_number[4])
  village_official<-append(village_official,part1_number[5])
  religious_leader<-append(religious_leader,part1_number[6])
  PKK<-append(PKK,part1_number[7])
  pharmacist<-append(pharmacist,part1_number[8])
  teacher<-append(teacher,part1_number[9])
  television<-append(television,part1_number[10])
  radio<-append(radio,part1_number[11])
  number_of_women<-append(number_of_women,part1_number[12])
}
for(i in part2){
  part1_number<-str_extract_all(i,"([1-9]\\d*\\.?\\d*)|(0\\.\\d*[1-9])",simplify = T)
  private_doctor<-append(private_doctor,part1_number[2])
  private_midwife<-append(private_midwife,part1_number[3])
  family_planning_field_worker<-append(family_planning_field_worker,part1_number[4])
  village_official<-append(village_official,part1_number[5])
  religious_leader<-append(religious_leader,part1_number[6])
  PKK<-append(PKK,part1_number[7])
  pharmacist<-append(pharmacist,part1_number[8])
  teacher<-append(teacher,part1_number[9])
  television<-append(television,part1_number[10])
  radio<-append(radio,part1_number[11])
  number_of_women<-append(number_of_women,part1_number[12])
}
for(i in part3){
  part1_number<-str_extract_all(i,"([1-9]\\d*\\.?\\d*)|(0\\.\\d*[1-9])",simplify = T)
  private_doctor<-append(private_doctor,part1_number[2])
  private_midwife<-append(private_midwife,part1_number[3])
  family_planning_field_worker<-append(family_planning_field_worker,part1_number[4])
  village_official<-append(village_official,part1_number[5])
  religious_leader<-append(religious_leader,part1_number[6])
  PKK<-append(PKK,part1_number[7])
  pharmacist<-append(pharmacist,part1_number[8])
  teacher<-append(teacher,part1_number[9])
  television<-append(television,part1_number[10])
  radio<-append(radio,part1_number[11])
  number_of_women<-append(number_of_women,part1_number[12])
}
Region<-c("DKI Jakarta","West Java","Central Java","DI Yogyakarta","East Java","Bali","DI Aceh","North Sumatra","West Sumatra","South Sumatra","Lampung","West Nusa Tenggara","West Kalimantan","South Kalimantan","South Kalimantan","North Sulawesi","South Sulawesi","Riau","Jambi","Bengkulu","East Nusa Tenggara","East Timor","Central Kalimantan","East Kalimantan","Central Sulawesi","Southeast Sulawesi","Maluku","Irian Jaya")
table=data.frame(
  Region,
  private_doctor,
  private_midwife,
  family_planning_field_worker,
  village_official,
  religious_leader,
  PKK,
  pharmacist,
  teacher,
  television,
  radio,
  number_of_women
)
write.table(table,"D:\\Work\\part-time_work\\4.2\\project\\output\\data\\cleaned_data.csv")
