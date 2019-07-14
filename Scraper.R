install.package("jsonlite")
library(jsonlite)
install.packages("tidyverse")

setwd("C:/Users/henri/Data/Macroambiente-BR")

#data do pib

data_pib <- fromJSON("https://servicodados.ibge.gov.br/api/v1/conjunturais?&d=s&user=ibge&t=1846&v=585&p=199601-205701&ng=1(1)&c=11255(90707)")

View(data_pib)

#cria coluna nova com valor de data parseado

data_pib$date <- ifelse(grepl("1º trimestre", data_pib$p), gsub("1º trimestre ", "01-03-", data_pib$p), 
                    ifelse(grepl("2º trimestre", data_pib$p), gsub("2º trimestre ", "01-06-", data_pib$p), 
                           ifelse(grepl("3º trimestre", data_pib$p), gsub("3º trimestre ", "01-09-", data_pib$p),
                                  ifelse(grepl("4º trimestre", data_pib$p), gsub("4º trimestre ", "01-12-", data_pib$p),"no"))))


# corrige o formato da data da coluna Date
library(lubridate)
data_pib$date <- dmy(data_pib$date)

#corrige formato do dado na coluna V
data_pib$v <- as.integer(data_pib$v)

#cria nova coluna de valor
data_pib$pib <- data_pib$v * 1



#data da descocupação

data_desoc <- fromJSON("https://servicodados.ibge.gov.br/api/v1/conjunturais?&d=s&user=ibge&t=6381&v=4099&p=-1000&ng=1(1)&c=")

View(data_desoc)

#cria coluna nova com valor de data parseado

data_desoc$date <- ifelse(grepl("jan-fev-mar", data_desoc$p), gsub("jan-fev-mar ", "01-03-", data_desoc$p),
                          ifelse(grepl("abr-mai-jun ", data_desoc$p), gsub("abr-mai-jun ", "01-06-", data_desoc$p),
                                 ifelse(grepl("jul-ago-set ", data_desoc$p), gsub("jul-ago-set ", "01-09-", data_desoc$p),
                                        ifelse(grepl("out-nov-dez ", data_desoc$p), gsub("out-nov-dez ", "01-12-", data_desoc$p),"no"))))

# corrige o formato da data da coluna Date
library(lubridate)
data_desoc$date <- dmy(data_desoc$date)

#corrige formato do dado na coluna V
data_desoc$v <- as.integer(data_desoc$v)

#cria nova coluna de valor
data_desoc$desoc <- data_desoc$v * 1

 


