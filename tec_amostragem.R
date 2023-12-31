#---------------------------------------------------------
# Titulo: Nocoes sobre o software estatistico R/RStudio. 
#---------------------------------------------------------
# Autor : Peter de Matos Campos/UFSJ/DEMAT                         
# Data  : 19/03/2023
# Versao: v4
#----------------------------------------------------
# Objetivo: ilustrar o uso dos metodos de amostragem
#           probabilistica no R.
#----------------------------------------------------
# Sumario
#----------------------------------------------------
# 1) Exemplo de uma funcao no R
# 2) Gerar numeros aleatorios
# 3) Amostragem Aleatoria Simples (AAS).
# 4) Amostragem Sistematica (AS).
# 5) Amostragem Estratificada (AE).
#---------------------------------------------------
# Envie as instrucoes abaixo para o interpretador R
# (inicialmente linha por linha ou pequenas selecoes)
# para se familiarizar com os principais recursos.
#---------------------------------------------------
# Referencia Bibliografica                        
#---------------------------------------------------
# Apostila R_Final-Dani, pags 13-14
#---------------------------------------------------
# Antes de tudo "Limpe a memoria"!!
#---------------------------------------------------
# Vc tem duas opcoes
# 1) Usar a vassourinha da janela!
# 2) Usar o comando
rm(list=ls())

#---------------------------------------------------
# 1) Exemplo de uma funcao no R
#---------------------------------------------------
#         Anatomia de uma funcao no R
#---------------------------------------------------
# Definindo da funcao
# nome_da_funcao <- function(parametro1, parametro2){
#   resultado <- parametro1*parametro2
#   limits <- c(0, x, y,Inf)
#   labels <- c("Rotulo 1", "Rotulo 2", ...)
# return(list())
#}
# Imprimindo o resultado
# print(nome_da_funcao(parametro1, parametro2))

#---------------------------------------------------
# Exemplo de funcao para calcular e classificar IMC
#---------------------------------------------------
# Criando um data.frame
peso <- c(75,125,65,78)
altura <- c(1.85,1.75,1.55,1.60)
dados <- data.frame(peso,altura)

# Definindo a funcao
Class_imc <- function(dados){
  imc <- dados$peso/dados$altura^2
  limits <- c(0,18.5,25,30,Inf)
  labels <- c("Magresa","Adequado", 
              "Pré-obeso","Obesidade")
  classif <- labels[findInterval(imc,vec = limits)]
  return(list(IMC = imc, Classificação = classif))
}

# Imprimindo o resultado
print(Class_imc(dados))
#---------------------------------------------------
#---------------------------------------------------

#---------------------------------------------------
#---------------------------------------------------
#      TECNICAS DE AMOSTRAGEM PROBABILISTICA
#---------------------------------------------------
#---------------------------------------------------
# 2) Gerar numeros aleatorios
#---------------------------------------------------
# a) definir o valor da semente
# Para termos a mesma amostra devemos fixar o valor
# inicial, ou sua semente. 
set.seed(10)

# b) gerar numeros aleatorios (r = randon, norm = normal)
rnorm(5)             # amostra de 5 elementos

rnorm(5) # outra amostra de 5 elementos

set.seed(10) # retorna o valor da semente ao valor inicial
rnorm(5) # gera novamente a primeira amostra de 5 elementos

#---------------------------------------------------
# 3) AMOSTRAGEM ALEATORIA SIMPLES - AAS
#---------------------------------------------------
#---------------------------------------------------
# PROCEDIMENTO BASICO AAS
#---------------------------------------------------
# 1) Numerar todos os elementos da populacao.
# 2) Fazer o "sorteio" de n elementos com reposicao.
#---------------------------------------------------
# Opcao 1 - Usando a funcao runif( )
#---------------------------------------------------
# Definindo a amostra pelo numero de registro
# Entrar com o tamanho da População e da amostra
N <- 500
n <- 5

# Retirar aleatoriamente a amostra
aas1 <- round(runif(n,1,N))  
aas1

#---------------------------------------------------
# Opcao 2 - Usando a funcao sample( )
#---------------------------------------------------
# Definindo a amostra pelo numero de registro
x <- seq(1:500)
aas2 <- sample(x,size = 10,replace = TRUE)
aas2 <- sample(1:500,10)
aas2

# Ordenar os dados
sort(aas2)

# A amostra sera:
#  aas2 = {x1 = 1º INDIVIDUO, x2 = 16º INDIVIDUO,
#          x3 = 601º INDIVIDUO, x4 = 745º INDIVIDUO,
#          x5 = 800º INDIVIDUO}

# Definindo a amostra pelos valores observados
#---------------------------------------------------
# Exemplo psicometrico.             
#---------------------------------------------------                                                                         
# Admita que um grupo com 98 adultos (N = 98)
# seja nossa populacao de interesse. Alem disso,
# com o auxilio da escala Wechsler, definiu-se que
# o Quociente de Inteligencia (QI) e a caracte-
# ristica que se quer estudar. Considerando que
# esta populacao seja homogenea, retire uma amostra
# aleatoria simples de tamanho 10 elementos (n = 10),
# para estudar o Quociente de Inteligencia (QI).

# Ler os dados do arquivo qi.txt.
dados <- read.table("~/Documentos/Estatística/qi.txt", h = TRUE, sep = "")
dados <- edit(dados)

# Caso se tenha um dataset
aas3 <- sample(dados$qi,10, replace = TRUE)
aas3

# Ordenar os dados
sort(aas3)

# A amostra sera:
#  aas2 = {x1 = 77.6, x2 = 101.9, x3 = 107.1, 
#          x4 = 113.5, x5 = 117.7}

# Tracar um grafico e calculo da media
hist(aas3)
mean(aas3)
#---------------------------------------------------

#---------------------------------------------------
# 4) AMOSTRAGEM SISTEMATICA - AS
#---------------------------------------------------
# Estamos interessados em levantar a proporcao
# de alunos da Computacao da UFSJ que sao de Sao 
# Joao del-Rei. Admita que a populacao tenha N = 600 
# alunos. Definiu-se que serÃ£o investigados n = 6
# alunos e que a amostra sera obtida atraves de
# uma Amostragem Sistematica (AS). Quais sao os
# alunos que devem ser entrevistados? Utilize
# a funcao randomica da calculadora, escreva o
# procedimento e a amostra resultante.
#---------------------------------------------------
# PROCEDIMENTO BASICO AS
#---------------------------------------------------
# 1) Calcular o intervalo de amostragem (i)
N <- 600
n <- 8
i <- trunc(N/n);i # trunca o resultado da divisao.
#---------------------------------------------------
# 2) Sortear um numero x, entre 1 e i
x <- sample(1:i, size = 1);x
x <- 58
#---------------------------------------------------
# 3) criar a amostra sistematicamente
#    soma-se a x (primeira observacao selecionada)
#    o valor do intervalo de amostragem (i) ate 
#    que se complete a amostra.

#    Usamos a funcao seq( ) que cria uma sequencia
#    de x ate x+(n-1)*i. 
#---------------------------------------------------
# Opcao 1 - uasando a expressao matematica
as1 <- seq(x,x+(n-1)*i,i)
as1
#---------------------------------------------------
# Opcao 2 - Usando a ideia
as2 <- seq(from = x, by = i, length.out = n)
as2
#---------------------------------------------------
# A amostra sera:

# as = {x1 = 44 ind,x2 = 119º ind,x3 = 194º ind,
#       x4 = 269º ind,x5 = 344º ind,x6 = 419º ind,
#       x7 = 494º ind, x8 = 569º ind}

#---------------------------------------------------
# 5) AMOSTRAGEM ESTRATIFICADA - AE
#---------------------------------------------------
# Exemplo 3.6 (Barbetta, p.50, Portal Didatico).                 
#---------------------------------------------------                                                                                      
# Interessados em saber como os membros de uma
# comunidade universidade estão reagindo à pandemia
# realizou-se um levantamento por amostragem que,
# dentre outras características, mediu o nível 
# de estresse. A população é composta por 800
# professores, 550 servidores técnicos 
# administrativos e 12.000 alunos, que
#identificaremos da seguinte forma:

# Populacao
# Professores: P1 P2 P3 P4 P5 P6 P7 P8 P9 ... P800.
# Servidores:  S1 S2 S3 S4 S5 S6 S7 S8 S9 ... S550.   
# Alunos:      A1 A2 A3 A4 A5 A6 ... A12.000.

# Supondo que a preferencia, quanto ao estilo de
# lideranca, possa ser relativamente homogenea
# dentro de cada categoria, vamos realizar uma
# Amostragem Estratificada Proporcional por
# categoria, para obter uma amostra global de
# tamanho n = 30. Escreva o procedimento e a
# amostra resultante.
#---------------------------------------------------
# PROCEDIMENTO BASICO AE
#---------------------------------------------------
# Opcao 1 - Fazendo passo a passo "na unha" 
#---------------------------------------------------
# 1) Definindo o tamanho da populacao e dos estratos
N  <- 13350 # Tamanho da populacao (Total)       (N)
N1 <- 800   # Tamanho do estrato 1 (Professores) (N1)
N2 <- 550   # Tamanho do estrato 2 (Servidores)  (N2)
N3 <- 12000 # Tamanho do estrato 3 (Alunos)      (N3)

# Numerando os elementos do estrato 1
prof <- seq(1:800)

#Numerando os elementos do estrato 2
serv <- seq(1:550)   

#Numerando os elementos do estrato 3
alun <- seq(1:12000)

# 2) Calcular a proporcao de cada estrato na populacao
p1 <- round(N1/N,2);p1
p2 <- round(N2/N,2);p2
p3 <- round(N3/N,2);p3
p <- (p1+p2+p3);p         # A soma tem que ser 1.

# 3) Calcular quantos elementos amostrar por estrato. 
n <- 30           # Para uma amostra de 10 elementos.
n1 <- round(p1*n,0);n1 # n1 sao do estrato 1.
n2 <- round(p2*n,0);n2 # n2 sao do estrato 2.
n3 <- round(p3*n,0);n3 # n2 sao do estrato 3.
n <- (n1+n2+n3);n      # A soma tem que ser n = 10.

# Construr uma tabela para resumir os resultados.

# Criando uma matriz de zeros com 4 linhas e 3 colunas
tab <- matrix(0,4,3);tab

# Nomeando colunas e linhas
colnames(tab) <- c("Estrato","Proporcao",
                   "ni");tab
rownames(tab) <- c("Professores","Servidores",
                   "Alunos","Total");tab

# Preenchendo a tabela (Matriz)
# Dentro dos colchetes [n. da linha,n. da coluna]
tab[1:4,1] <- c(N1,N2,N3,N);tab  
tab[1:4,2] <- c(p1,p2,p3,p);tab
tab[1:4,3] <- c(n1,n2,n3,n);tab

# 4) Selecionar aleatoriamente os elementos de cada 
#    estrato.
ae1 <- sample(prof,n1);ae1
ae2 <- sample(serv,n2);ae2
ae3 <- sample(alun,n3);ae3
ae <- c(ae1,ae2,ae3);ae

sort(ae)
# ae = {        }

#---------------------------------------------------
# Opcao 2 - Usando a funcao strata() do pacote sampling 
#---------------------------------------------------
#---------------------------------------------------
# install.packages('sampling')
#---------------------------------------------------
library(sampling)

#---------------------------------------------------
# Visualizando os datasets do Rbase
#---------------------------------------------------
data()

#---------------------------------------------------
# Utilizando o dataset ChickWeight
#---------------------------------------------------
frangos <- ChickWeight
fi <- table(frangos$Diet)
fr <- round(fi/length(frangos$Diet),2);fr

#---------------------------------------------------
# Retirando uma amostra estratificada proporcional
#---------------------------------------------------
ae <- strata(data=frangos,
             stratanames = c("Diet"),
             size=c(38,21,21,20), 
             method='srswor') 
# srswor - simple random sampling without replacement

#-------------------------------------------------------
#                     FIM SCRIPT
#-------------------------------------------------------