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
all_content<-pdf_text("D:\\Work\\part-time_work\\4.2\\project\\input\\data\\FR18.pdf")#read the pdf 
#choose to the page where we get the raw data
page<-stri_split_lines(all_content[[76]])[[1]]
write.table(page,"D:\\Work\\part-time_work\\4.2\\project\\output\\data\\raw_data.csv")
