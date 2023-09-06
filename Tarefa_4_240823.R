#TAREFA 4 - 24/08/23
# tarefa - organizar o endereço
# Rua/Local
# numero
# Cidade/Planeta


library(tidyverse)
library(pdftools)
library(lubridate)

endereco <- pdf[grepl("End",pdf)]
endereco <- str_replace(endereco, "CEP: \\d{5}-\\d{3}", "") %>% str_replace("Endereço: Rua", "Rua")%>%
  str_replace("Endereço:", "") %>% str_replace("Sietch Tabr", "Rua Sietch Tabr") %>% 
  str_replace("Kaer Morhen", "Rua Kaer Morhen")

rua <- str_extract(endereco, "Rua [^,]+")
rua

num <- str_extract(endereco, "\\d+") %>% replace_na("SN")
num

cidade <- str_extract(endereco, "[^,]+$")
cidade

endereco_matr <- c(rua, num, cidade)
endereco_matr
