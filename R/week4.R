#Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(tidyverse)

#Data Import
import_tbl <- read_delim("../data/week4.dat", delim = "-", col_names = c("casenum","parnum","stimver","datadate","qs"))
glimpse(import_tbl)
wide_tbl <-separate(import_tbl, qs, c("q1", "q2", "q3", "q4", "q5"), sep = "-")
wide_tbl[c("q1", "q2", "q3", "q4", "q5")] <- sapply(wide_tbl[c("q1", "q2", "q3", "q4", "q5")], as.integer)
wide_tbl$datadate<- as.POSIXct(wide_tbl$datadate, format = "%b %d %Y, %H:%M:%S")
is.na(wide_tbl[,c("q1", "q2", "q3", "q4", "q5")]) <- !wide_tbl[,c("q1", "q2", "q3", "q4", "q5")]




wide_tbl<- wide_tbl[!is.na(wide_tbl$q2), ]




