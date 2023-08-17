#Lição (17/08/23): buscar o cep e colocar em uma variável no formato 00000-000

z <- pdf[grepl("CEP:", pdf)]

z <- gsub("\\D", "", z) # \\D para encontrar todos os caracteres não numéricos.

z <- gsub("(\\d{5})(\\d{3})", "\\1-\\2", z) #\\d{5} refere-se ao grupo dos 5 primeiros digitos e \\d{3} ao grupo dos 3 ultimos digitos. \\1 e \\2 são as referencias dos grupos

z