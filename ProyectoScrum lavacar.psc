Algoritmo Lavacar_Descuentos
	
	Definir usuario, correo, contrasena, placa Como Cadena
	Definir diaSemana, turno, tipoLavado, tipoVehiculo Como Cadena
	Definir descuento, precioBase, precioFinal Como Real
	
	Definir placaFavorita, colorFavorito, marcaFavorita Como Cadena
	Definir respuestaFavorito Como Cadena
	Definir ultimoCaracter Como Cadena
	
	Escribir "Bienvenido al Lavacar"
	Escribir "Ingrese su nombre de usuario:"
	Leer usuario
	Escribir "Ingrese su correo electr�nico:"
	Leer correo
	Escribir "Cree una contrase�a:"
	Leer contrasena
	
	Escribir "�Desea registrar un auto favorito? (s�/no)"
	Leer respuestaFavorito
	respuestaFavorito <- Minusculas(respuestaFavorito)
	
	Si respuestaFavorito = "si" Entonces
		Escribir "Ingrese la placa del auto favorito:"
		Leer placaFavorita
		Escribir "Ingrese el color del veh�culo favorito:"
		Leer colorFavorito
		Escribir "Ingrese la marca del veh�culo favorito:"
		Leer marcaFavorita
		placa <- placaFavorita
	Sino
		Escribir "Ingrese la placa del veh�culo:"
		Leer placa
	FinSi
	
	Escribir "Ingrese el d�a de la semana (ej: lunes, martes...):"
	Leer diaSemana
	diaSemana <- Minusculas(diaSemana)
	
	Escribir "�Turno de d�a o noche?"
	Leer turno
	turno <- Minusculas(turno)
	
	Escribir "Seleccione el tipo de lavado:"
	Escribir "1. Lavado profundo"
	Escribir "2. Tratamiento especial"
	Leer tipoLavado
	
	Escribir "Seleccione el tipo de veh�culo:"
	Escribir "1. Autom�vil"
	Escribir "2. 4x4 / SUV"
	Escribir "3. Cami�n"
	Escribir "4. Moto"
	Leer tipoVehiculo
	
	// Asignar precio base seg�n tipo de lavado y veh�culo
	Segun tipoLavado Hacer
		Caso "1": // Lavado profundo
			Segun tipoVehiculo Hacer
				Caso "1":
					precioBase <- 9000
				Caso "2":
					precioBase <- 12000
				Caso "3":
					precioBase <- 20000
				Caso "4":
					precioBase <- 5000
			FinSegun
		Caso "2": // Tratamiento especial
			Segun tipoVehiculo Hacer
				Caso "1":
					precioBase <- 15000
				Caso "2":
					precioBase <- 18000
				Caso "3":
					precioBase <- 30000
				Caso "4":
					precioBase <- 8000
			FinSegun
		De Otro Modo:
			Escribir "Opci�n inv�lida. Se asignar� lavado profundo para autom�vil por defecto."
			precioBase <- 9000
	FinSegun
	
	descuento <- 0
	
	// Descuento por horario
	Si turno = "noche" Entonces
		descuento <- descuento + 0.15
	Sino
		descuento <- descuento + 0.05
	FinSi
	
	// Descuento por tipo de placa (�ltimo car�cter)
	ultimoCaracter <- SubCadena(placa, Longitud(placa), 1)
	
	Si ultimoCaracter = "0" O ultimoCaracter = "1" O ultimoCaracter = "2" O ultimoCaracter = "3" O ultimoCaracter = "4" O ultimoCaracter = "5" O ultimoCaracter = "6" O ultimoCaracter = "7" O ultimoCaracter = "8" O ultimoCaracter = "9" Entonces
		descuento <- descuento + 0.10
	Sino
		Si ultimoCaracter = "a" O ultimoCaracter = "e" O ultimoCaracter = "i" O ultimoCaracter = "o" O ultimoCaracter = "u" Entonces
			descuento <- descuento + 0.07
		Sino
			descuento <- descuento + 0.05
		FinSi
	FinSi
	
	// Descuento por d�a de la semana
	Si diaSemana = "lunes" O diaSemana = "martes" O diaSemana = "mi�rcoles" O diaSemana = "jueves" O diaSemana = "viernes" Entonces
		descuento <- descuento + 0.10
	Sino
		descuento <- descuento + 0.03
	FinSi
	
	precioFinal <- precioBase - (precioBase * descuento)
	
	Escribir "Resumen de su lavado:"
	Escribir "Usuario: ", usuario
	Escribir "Correo: ", correo
	Escribir "D�a: ", diaSemana
	Escribir "Turno: ", turno
	Escribir "Placa: ", placa
	Escribir "Tipo de lavado: ", tipoLavado
	Escribir "Tipo de veh�culo: ", tipoVehiculo
	Escribir "Descuento aplicado: ", descuento * 100, "%"
	Escribir "Precio final: ", precioFinal
	
	Si respuestaFavorito = "si" Entonces
		Escribir "Auto favorito registrado:"
		Escribir "Placa: ", placaFavorita
		Escribir "Color: ", colorFavorito
		Escribir "Marca: ", marcaFavorita
FinSi

FinAlgoritmo
