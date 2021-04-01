
#Relação entre irrigação e acesso a água potavel na America Latina#

#Carregar os dados
dados = read.csv("riego_acesso_Aquastat.csv",header=TRUE)

#Verificar os dados
str(dados)

#Observar variaveis isoladas
plot(Poblacion_accesso_agua_potable ~ Ano , data = dados)
plot(Superficie_riego ~ Ano , data = dados)

#Observar dados por pais
library("ggplot2")
ggplot(dados, aes(x=Ano, y=Superficie_riego)) +
  geom_point()

ggplot(dados, aes(x=Ano, y=Superficie_riego, group=Pais, color=Pais)) +
  geom_line()

ggplot(dados, aes(x=Ano, y=Poblacion_accesso_agua_potable, group=Pais, color=Pais)) +
  geom_line()
