
## Pacotes

install.packages("tidyverse")
install.packages("gridExtra")


library(tidyverse)
library(ggplot2)
library("gridExtra")


## Diretório

setwd("C:/Users/henri/Data/Macroambiente-BR")

#Criação da tabela base para o gráfico

pibdesoc <- data_pib %>%
  left_join(data_desoc, by = "date")%>%
  mutate(Período = date)

view(pibdesoc)


#gráfico

grafico1 <- ggplot(pibdesoc, aes(x=Período, y=pib, group = 1))+
  geom_line(color="blue")+
  geom_point()+
  labs(title = "PIB brasileiro por trimestre a partir de 2014", subtitle = "Em milhões de reais", caption = "Fonte: Sistema de Contas Nacionais Trimestrais - SCNT (IBGE)")

grafico2 <- ggplot(pibdesoc, aes(x = Período, y=desoc))+
  geom_line(color="green")+
  geom_point()+
  labs(title = "Taxa de desocupação da população brasileira a partir de 2014", subtitle = "Em porcentagem", caption = "Fonte: Pesquisa Nacional por Amostra de Domicílios Contínua - PNAD Contínua (IBGE)")

