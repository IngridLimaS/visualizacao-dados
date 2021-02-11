
###Conferir Data Frames###

#Verificar diretorio
getwd() 

#carregar os dados
aves <- read.table("aves_cerrado.csv", row.names = 1,
                   header = TRUE, sep = ";",
                   dec = ",", as.is = TRUE)

#Conferir atributos
str(aves)
head(aves)
tail(aves)

#Verificar NA
aves$urubu
aves$urubu == NA
is.na(aves$urubu)
which(is.na(aves$urubu))
aves[is.na(aves$urubu), ]
aves$fisionomia[is.na(aves$urubu)]

#Conferir Fatores
unique(aves$fisionomia)
table(aves$fisionomia)

#Corrigir nível
aves$fisionomia == "ce"
aves[aves$fisionomia == "ce", ]
aves$fisionomia[aves$fisionomia == "ce"]
aves$fisionomia[aves$fisionomia == "ce"] <- "Ce"
table(aves$fisionomia)

#Converter vetor em fator
aves$fisionomia <- factor(aves$fisionomia, levels = c("CL", "CC", "Ce"))

#Verificar valores
str(aves)
