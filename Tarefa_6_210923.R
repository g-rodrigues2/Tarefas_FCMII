library(RSelenium)
library(wdman)
library(netstat)
library(tidyverse)
library(rvest)

wpage <- "https://emec.mec.gov.br/emec/nova"

selenium(retcommand = TRUE, check = TRUE) #para instalar os drivers necessários

#iniciando o robô
remote_driver <- rsDriver(
  browser = "firefox",
  port = free_port(),
  verbose = FALSE,
  chromever = NULL # necessário se utilizar o chrome
)

remDr <- remote_driver$client

remDr$navigate(wpage) #para navegar na página de interesse
Sys.sleep(15) #coloca o sistema para dormir por 15s para dar tempo das páginas abrirem

#clicando em cada uma das abas da página
consulta_textual <- remDr$findElement(using = "xpath", value = "/html/body/div[2]/div[2]/div/div[3]/ul/li[2]/a")
consulta_textual$clickElement()

IES_extintas <- remDr$findElement(using = "xpath", value = "/html/body/div[2]/div[2]/div/div[3]/ul/li[3]/a")
IES_extintas$clickElement()

consulta_avancada <- remDr$findElement(using = "xpath", value = "/html/body/div[2]/div[2]/div/div[3]/ul/li[1]/a")
consulta_avancada$clickElement()
