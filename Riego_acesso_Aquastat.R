
#Relação entre irrigação e acesso a água potavel na America Latina#

#Carregar os dados
dados = read.csv("riego_acesso_Aquastat.csv",header=TRUE)

#Verificar os dados
str(dados)
summary(dados)

#Observar variaveis isoladas
plot(Poblacion_accesso_agua_potable ~ Ano , data = dados)
plot(Superficie_riego_Ha ~ Ano , data = dados)

#Observar dados por pais
library("ggplot2")

ggplot(dados, aes(x=Ano, y=Superficie_riego_Ha)) +
  geom_point()

ggplot(dados, aes(x=Ano, y=Superficie_riego_Ha, group=Pais, color=Pais)) +
  geom_line() + geom_point(aes(y = Superficie_riego_Ha)) + 
  scale_x_continuous(breaks=c(1992,1997,2002,2007, 2012, 2017), minor_breaks=F) +
  geom_point()


ggplot(dados, aes(x=Ano, y=Poblacion_accesso_agua_potable, group=Pais, color=Pais)) +
  geom_line() + geom_point(aes(y = Poblacion_accesso_agua_potable)) + 
  scale_x_continuous(breaks=c(1992,1997,2002,2007, 2012, 2017), minor_breaks=F) +
  geom_point()


