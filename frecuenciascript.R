
#Nuvem de palavras#

#definir diret?rio
dir()

#Criar tabela de frequencia

texto <- scan("naturaleza.txt", what="char", sep="\n", encoding = "UTF-8")
texto <- tolower(texto)

lista_palavras <- strsplit(texto, "\\W+")
vetor_palavras <- unlist(lista_palavras)

frequencia_palavras <- table(vetor_palavras)
frequencia_ordenada_palavras <- sort(frequencia_palavras, decreasing=TRUE)

palavras <- paste(names(frequencia_ordenada_palavras), frequencia_ordenada_palavras, sep=";")

cat("Palavra;Frequencia", palavras, file="frequencias.csv", sep="\n") 

#Instala??o dos pacotes
install.packages("wordcloud")
install.packages("tm")
install.packages("SnowballC")
install.packages("RColorBrewer")

#Carregar os pacotes
library(tm)
library(SnowballC)
library(wordcloud)
library(RColorBrewer)

#Importar dados
nuvem <- read.csv(file.choose("frecuencias.csv"), header = T, sep=",")
View(nuvem)
head(nuvem)

#Carregue os dados como um corpus
docs <- Corpus(VectorSource(nuvem))

#Inspecione o conte?do do documento
inspect(docs)

#Transforma??o de texto
toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "/")
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, "\\|")

# Converta o texto para min?sculas
docs <- tm_map(docs, content_transformer(tolower))
# Remover n?meros
docs <- tm_map(docs, removeNumbers)
# Remover palavras irrelevantes comuns em ingl?s
docs <- tm_map(docs, removeWords, stopwords("english"))
# DEfinir palavras removidas
# specify your stopwords as a character vector
docs <- tm_map(docs, removeWords, c("on", "this")) 
# Remover pontu??es
docs <- tm_map(docs, removePunctuation)
# Eliminar espa?os adicionais
docs <- tm_map(docs, stripWhitespace)
# Lematiza??o
# docs <- tm_map(docs, stemDocument)

#Gerar nuvem de palavras
set.seed(1234)
wordcloud(words = nuvem$word, freq = nuvem$freq, min.freq = 1,
          max.words=50, random.order=FALSE, rot.per=0.10,
          colors=brewer.pal(8, "Dark2"))

#Plotar a frequ?ncia das palavras
barplot(nuvem[1:15,]$freq, las = 2, names.arg = nuvem[1:15,]$word,
        col ="lightblue", main ="Most frequent words",
        ylab = "Word frequencies")
###End###