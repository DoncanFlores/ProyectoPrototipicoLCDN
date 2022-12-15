#Importando librerias necesarias
install.packages("matlib")
library(matlib)

#Generacion del sistema de ecuaciones

#Ingreso de nuestra matriz que relaciona las alcaldias con personas que conocen a victimas de violencia

Datos <- matrix(c(1,2,3,4,5,6,7,8,9,34,2,7,3,5,1,0,1,1),nr=9,nc=2)
Datos

#Colocamos nombre a los indices
colnames(Datos) <- c('Alcaldia','Conoces_Victimas_Violencia')
colnames(Datos)

#Revisamos nuestra matriz 
Datos
Datos_DF <- data.frame(Datos)
Datos_DF

#Buscando la suma de nuestras xi (variables)
#Buscando la suma de nuestras yi(Observaciones)



#Obteniendo las sumas de nuestras xi y yi
Sumas_Columnas <- apply (Datos[1:9 , ], 2, sum)
Sumas_Columnas

#Respuesta:                  Alcaldia Conoces_Victimas_Violencia 
#                                  45                         54



#Suma de la multiplicacion de xiyi
Sumaxiyi <- ((Datos_DF[1,2])*1+(Datos_DF[2,2])*2+(Datos_DF[3,2])*3
             +(Datos_DF[4,2])*4+(Datos_DF[5,2])*5+(Datos_DF[6,2])*6
             +(Datos_DF[7,2])*7+(Datos_DF[8,2])*8+(Datos_DF[9,2])*9)
Sumaxiyi


#Suma de las variables al cuadradp
xi2 <- ((Datos_DF[1,2])^2+(Datos_DF[2,2])^2+(Datos_DF[3,2])^2
             +(Datos_DF[4,2])^2+(Datos_DF[5,2])^2+(Datos_DF[6,2])^2
             +(Datos_DF[7,2])^2+(Datos_DF[8,2])^2+(Datos_DF[9,2])^2)
xi2



#Obteniendo los coeficientes
#Agregando a la matriz los datos necesarios 

Variables <- matrix(c(9,54,54,1246),nr=2,nc=2)
Variables

Observaciones <- matrix(c(45,119))
Observaciones

Coeficientes <- inv(Variables)%*%Observaciones
Coeficientes

t(Coeficientes)
