library(ggplot2) #Chargement du pckge
library(dplyr)

path <- "C:/Users/Kelly/Documents/Cours 2A Alès/Visualisation"
setwd(path)
data = read.csv('DonneesParite.csv', sep=";")

data%>%
  head()

#Courbe classique de la feritilité des femmes françaises de 1960 à 2018 (nb d'enfants/femme)
data%>%
  filter(Country == "France")%>%
  ggplot(aes(x = Year, y = FertilityRate, group = 1))+geom_line(color = "blue")+geom_point(color = "blue")

#Courbe classique espérance de vie femmes françaises de 1960 à 2018
data%>%
  filter(Country == "France")%>%
  ggplot(aes(x = Year, y = LifeExpectancyFemale, group = 1))+geom_line(color = "blue")+geom_point(color = "blue")

str(data)
data$Year <- as.Date(data$Year,"%Y")

library(dygraphs)
library(xts)
data = drop_na(data,Year)
don=xts(x = data$FertilityRate, order.by = data$Year) #On créer un format xts
dygraph(don)#On trace
