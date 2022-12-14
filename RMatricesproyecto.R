install.packages("matlib")
library(matlib)

#Proyecto de estadistica multivariada
#Regresion lineal multiple

#Generando ambas matrices 
x1 <- c(1,2,3,4,5,6,7,8,9)
y1 <- c(24,2,6,3,3,1,1,1,1,34,2,7,3,5,1,0,1,1,1)

#Vector y
y <- matrix(c(1,2,3,4,5,6,7,8,9), nr=9,nc=1)
y

#Matriz X
x <- matrix(c(24,2,6,3,3,1,1,1,1,34,2,7,3,5,1,0,1,1,1), nr=9, nc=2)
x

#Realizando las operaciones necesarias 
#(xt*x)^-1

X1 <- t(x)%*%x
X1

#Obteniendo la inversa de X1
Xinv <- inv(X1)
Xinv

#Comprobando la inversa(Resultado identidad)
Xinv%*%X1

X1%*%Xinv

#Realizando las operaciones necesarias
#xt*y

XtY <- t(x)%*%y
XtY

#Generando los coeficientes 
#Bt=(xt*y)(xt*x)^-1

Bt <- Xinv%*%XtY
Bt

#Coeficientes de nuestra regresion lineal multiple 
t(Bt)


