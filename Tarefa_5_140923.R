library(tidyverse)
library(pdftools)
library(lubridate)
library(read.dbc)

raca_cor<- read.table("RACA_COR.cnv", skip = 1, sep =";", encoding = 'latin1') 
raca_cor$V1

str_extract(raca_cor$V1, "[\\dA-Za-z,]+$")

#Começando com o elemento 1M para extrair tudo após esse elemento. A função
#str_split_1 está rretirando os parênteses do  elemento.
cod_prob <- str_extract(raca_cor$V1[10], "1M.*") %>% str_split_1(",") %>% trimws("both")

#aqui estamos pegando os elemenos que são relacionados aos códigos acima.
desc_prob <- rep("RAÇA/COR (OUTROS INDEVIDOS)", length(cod_prob))

#extraindo agora os elementos das linhas de 1 até 9
#extraindo as vírgulas e os números (códigos) -- \\d+\\s*$ (um dígito ou mais, espaço em branco 0 ou mais, a partir do final da linha)
cod_bom <- raca_cor$V1 %>% gsub(",", "", .) %>% str_extract("\\d+\\s*$") %>% trimws("both")

#Como o 87 pertence a linha 10 e desejamos extrair os números das linhas de 1 até 9, fazemos
cod_bom <- cod_bom[1:9]

#extraindo  a descrição
#(?<=\\d).*(?=\\d{2}) procura dígitos (grupos de pesquisa), no entanto, só devolve o que está
#fora dos parenteses, ou seja, qualquer carectere (.) além dos especiais (*) 
descr_bom <- raca_cor$V1[1:9] %>% gsub(",", "", .) %>% trimws("both") %>% str_extract("(?<=\\d).*(?=\\d{2})") %>% 
  gsub("^\\d+", "", .) %>% trimws("both")

df<- data.frame(descricao= c(desc_prob, descr_bom), codigo = c(cod_bom, cod_prob))
