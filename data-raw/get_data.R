## ---- makedb
library(DBI)
library(RSQLite)
titanicdb<-dbConnect(SQLite(),dbname="../data-raw/titanic.sqlite") #potential error here may need '..' instead of '.'

## ---- writeTitanic
library(PASWR)
dbWriteTable(titanicdb, "titanic", titanic3, overwrite=TRUE)
