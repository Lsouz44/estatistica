#----------------------------------------------
# Titulo: Nocoes basicas sobre o software 
#         estatistico R via interface R Studio. 
#----------------------------------------------
# Autor : Peter de Matos Campos/UFSJ/DEMAT                         
# Data  : 13/10/2019
# Versao: v3 
#-----------------------------------------------
# Objetivo: apresentar o R e o R Studio e 
#           algumas de suas funcionalidades
#           basicas. 
#-----------------------------------------------
# SUMARIO
# 1) COMO O R FUNCIONA?
#-----------------------------------------------
# Veja o exemplo de algumas operacoes basicas
# sem criar objetos:

1 + 2 + 3
1 + 2 * 3       
(1 + 2) * 3
9 / 3
2 ^ 3

# criando objetos (COMO SE TIVESSE COLOCANDO 
#                  NA MEMORIA DA CALCULADORA)

a <- 1 + 2 + 3       
b <- 1 + 2 * 3       
c <- (1 + 2) * 3
d <- 9 / 3
e <- 2 ^ 3

# Voce notou a diferenca?

# Algumas funcoes matematicas

exp(1)               # numero de Euler e^1
cos(3.141593)        # Cosseno
sin(1)               # Seno
log2(1)              # Logaritmo de base 2
sum(1:5)             # Soma
sqrt(4)              # raiz quadrada
2^3                  # um numero elevado
y <- 1:100
length(y)      # retorna o tamanho do objeto y

# No R, temos operacoes basicas e complexas e 
# muitas delas sao feitas por uma "funcao".

# Em geral, a sintaxe de uma funcao apresenta o
# nome da fucao e entre parentese seus argumentos.

# Um exemplo de uma funcao simples
# funcao round().
# A funcao "round" eh utilizada para fazer
# arredondamentos. Sua sintaxe eh:

# round(x, digits = 0).

# Possui dois argumentos:
# 1) x: eh o objeto (caixinha), resultado numerico.
# 2) digits = : eh o n�mero de casas decimais que
#               queremos fixar depois da virgula.

#-------------------------------------------------
# Exemplo pratico
#-------------------------------------------------
x <- pi    # atribuo o valor de pi ao objeto x
round(x,1) # fixo em 1 casa decimal.
round(x,2) # fixo em 2 casas decimais.

# outro exemplo 

# funcao sample
# a funcao sample retira uma amostra de tamanho 
# especificado dos elementos de x, com ou 
# sem reposicao.

# Sua sintaxe eh:
# sample(x, size, replace = FALSE, prob = NULL)

# Seus argumentos sao quatro:

# 1) x: eh o conjunto de dados de onde a amostra
#       sera retirada.
# 2) size: e o tamanho da amostra que sera tirada.
# 3) replace =: define se a amostragem sera com
#    (replace = TRUE) ou sem (replace = FALSE)
#    reposicao.
# 4) prob = NULL, opcional e da peso aos elementos
#                 do conjunto de dados.

# Exemplo pratico
x <- seq(1:200)
sample(x,size=10,replace=FALSE)
sample(x,size=15,replace=TRUE)
sample(x,15) # o default eh replace = FALSE

# O R reconhece os argumentos, mas cuidado! 

#--------------------------------------------------
# Limpando o console:
#--------------------------------------------------
# clique sobre o console e aperte conjuntamente
# o CTRL+L

dados <- rnorm(100, 10, 2)
dados

hist(dados)

#Carregando o pacote ggplot2
require(ggplot2)
library(ggplot2)
# dataset:
data=data.frame(value=rnorm(100))

# basic histogram
p <- ggplot(data, aes(x=value)) +
  geom_histogram()
p
