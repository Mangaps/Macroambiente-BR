
## Pacotes

install.packages("tidyverse")
install.packages("gridExtra")


library(tidyverse)
library(ggplot2)
library("gridExtra")


## Diret�rio

setwd("C:/Users/henri/Data/Macroambiente-BR")

#Cria��o da tabela base para o gr�fico

pibdesoc <- data_pib %>%
  left_join(data_desoc, by = "date")%>%
  mutate(Per�odo = date)

view(pibdesoc)


#gr�fico

grafico1 <- ggplot(pibdesoc, aes(x=Per�odo, y=pib, group = 1))+
  geom_line(color="blue")+
  geom_point()+
  labs(title = "PIB brasileiro por trimestre a partir de 2014", subtitle = "Em milh�es de reais", caption = "Fonte: Sistema de Contas Nacionais Trimestrais - SCNT (IBGE)")

grafico2 <- ggplot(pibdesoc, aes(x = Per�odo, y=desoc))+
  geom_line(color="green")+
  geom_point()+
  labs(title = "Taxa de desocupa��o da popula��o brasileira a partir de 2014", subtitle = "Em porcentagem", caption = "Fonte: Pesquisa Nacional por Amostra de Domic�lios Cont�nua - PNAD Cont�nua (IBGE)")

