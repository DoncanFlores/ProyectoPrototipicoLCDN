#Importamos nuestra encuesta de Excel
library(readxl)
#Aca acuerdense de poner la ruta de su archivo 
Violencia <- read_excel("C:/Users/EDGAR FLORES/Downloads/Violencia.xlsx") 
View(Violencia)

#Importamos las librerias necesarias para hacer la encuesta
install.packages("sqldf")
library('sqldf')

#Revisamos los indices de las columnas 
colnames(Violencia)

#Eliminamos la columna donde se encuentran las fechas
Violencia <- Violencia[,-1]
View(Violencia)

#Eliminamos tambien la columna donde se encuentran las propuestas, ya que para nuestros intereses no es necesaria
#Revisamos en que indice se encuentran
colnames(Violencia)

#Procedemos a borrar el indice numero 16
Violencia <- Violencia[,-16]
View(Violencia)

#Finalmente convertimos nuestra encuesta en un DataFrame
Violencia_DF <- data.frame(Violencia)
View(Violencia_DF)

#Procedemos a renombrar nuestras columnas para tener mayor orden y limpieza 
colnames(Violencia_DF)

colnames(Violencia_DF) <- c('Edad','Alcaldia','Nivel_Estudios','Has_Sufrido_Violencia','V_S_Psicologica',
                            'V_S_Economica','V_S_Fisica','V_S_Sexual','V_S_Patrimonial',
                            'Ambito_Escolar','Ambito_Laboral','Ambito_Comuni','Amnito_Familiar','Ambito_Pareja',
                            'Ambito_Digital','Conoces_victima_de_violencia')
View(Violencia_DF)

#Revisamos que efectivamente sea un DF
class(Violencia_DF)

#Consulta para el proyecto calculo y estadistica
#Numero de personas que si han sufrido violencia
sqldf("SELECT Alcaldia, COUNT (Alcaldia) AS 'Si_Sufri' FROM Violencia_DF WHERE Has_Sufrido_Violencia= 'Sí' GROUP BY Alcaldia")

#Numero de persinas que conocen a victimas de violencia
sqldf("SELECT Alcaldia, COUNT (Alcaldia) AS 'Si_Sufrio' FROM Violencia_DF WHERE Conoces_victima_de_violencia= 'Sí' GROUP BY Alcaldia")

#Revisamos los primeros 15 registros
sqldf('SELECT * FROM Violencia_DF LIMIT 15')

#Buscamos aquellas personas con una edad de 18-25 años 
sqldf("SELECT Alcaldia,COUNT (Alcaldia) AS '18-25' FROM Violencia_DF WHERE Edad= '18 - 25' GROUP BY Alcaldia")

#Buscamos el numero dee personas que no han surfrido violencia por alcaldia 
sqldf("SELECT Alcaldia, COUNT (Alcaldia) AS 'Si_Sufri' FROM Violencia_DF WHERE Has_Sufrido_Violencia= 'No' GROUP BY Alcaldia")

#Buscamos cuantas personas han sufrido violencia psicologica por alcaldia
sqldf("SELECT Alcaldia, COUNT (Alcaldia) AS 'Violencia_Psicologica' FROM Violencia_DF WHERE V_S_Psicologica= 'Si' GROUP BY Alcaldia")

#Buscamos cuantas personas han sufrido violencia Economica por alcaldia
sqldf("SELECT Alcaldia, COUNT (Alcaldia) AS 'Violencia_Economica' FROM Violencia_DF WHERE V_S_Economica= 'Si' GROUP BY Alcaldia")

#Buscamos cuantas personas han sufrido violencia Fisica por alcaldia 
sqldf("SELECT Alcaldia, COUNT (Alcaldia) AS 'Violencia_Fisica' FROM Violencia_DF WHERE V_S_Fisica= 'Si' GROUP BY Alcaldia")

#Buscamos cuantas personas han sufrido violencia sexual por alcaldia
sqldf("SELECT Alcaldia, COUNT (Alcaldia) AS 'Violencia_Sexual' FROM Violencia_DF WHERE V_S_Sexual= 'Si' GROUP BY Alcaldia")

#Buscamos aquellas personas que han sufrido violencia patrimonial por alcaldia
sqldf("SELECT Alcaldia, COUNT (Alcaldia) AS 'Violencia_Patrimonial' FROM Violencia_DF WHERE V_S_Patrimonial= 'Si' GROUP BY Alcaldia")

#Buscamos aquellas personas que sufrieron violencia en el trabajo por alcaldia
sqldf("SELECT Alcaldia, COUNT (Alcaldia) AS 'Violencia_Trabajo' FROM Violencia_DF WHERE Ambito_Laboral= 'Si' GROUP BY Alcaldia")

#Buscamos aquellas personas que sufrieron violencia en el ambito digital por alcaldia 
sqldf("SELECT Alcaldia, COUNT (Alcaldia) AS 'Violencia_Digital' FROM Violencia_DF WHERE Ambito_Laboral= 'Si' GROUP BY Alcaldia")

#Buscamos cuantas personas en el nivel universitario han sufrido violencia por alcaldia 
sqldf("SELECT Alcaldia, Nivel_Estudios, COUNT (Alcaldia) AS 'Violencia_Nvl_Universitario' FROM Violencia_DF WHERE Has_Sufrido_Violencia= 'Sí'and Nivel_Estudios='Universidad' GROUP BY Alcaldia")

#Buscamos cuantas personas en el nivel bachillerato han sufrido violencia por alcaldia
sqldf("SELECT Alcaldia, Nivel_Estudios, COUNT (Alcaldia) AS 'Violencia_Nvl_Bachillerato' FROM Violencia_DF WHERE Has_Sufrido_Violencia= 'Sí'and Nivel_Estudios='Bachillerato' GROUP BY Alcaldia")

#Buscamos cuantas personas en el ambito de pareja han sufrido violencia
sqldf("SELECT Alcaldia, COUNT (Alcaldia) AS 'Violencia_Pareja' FROM Violencia_DF WHERE Ambito_Pareja= 'Si' GROUP BY Alcaldia")


#Buscamos cuntas personas en el ambito pareja han sufrido violencia y que tengan su nivel de estudios sea universitario
sqldf("SELECT Alcaldia, Nivel_Estudios, COUNT (Alcaldia) AS 'Violencia_Pareja' FROM Violencia_DF WHERE Ambito_Pareja= 'Si'and Nivel_Estudios='Universidad' GROUP BY Alcaldia")
