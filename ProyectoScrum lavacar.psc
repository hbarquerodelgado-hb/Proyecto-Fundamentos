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
	Escribir "Ingrese su correo electrónico:"
	Leer correo
	Escribir "Cree una contraseña:"
	Leer contrasena
	
	Escribir "¿Desea registrar un auto favorito? (sí/no)"
	Leer respuestaFavorito
	respuestaFavorito <- Minusculas(respuestaFavorito)
	
	Si respuestaFavorito = "si" Entonces
		Escribir "Ingrese la placa del auto favorito:"
		Leer placaFavorita
		Escribir "Ingrese el color del vehículo favorito:"
		Leer colorFavorito
		Escribir "Ingrese la marca del vehículo favorito:"
		Leer marcaFavorita
		placa <- placaFavorita
	Sino
		Escribir "Ingrese la placa del vehículo:"
		Leer placa
	FinSi
	
	Escribir "Ingrese el día de la semana (ej: lunes, martes...):"
	Leer diaSemana
	diaSemana <- Minusculas(diaSemana)
	
	Escribir "¿Turno de día o noche?"
	Leer turno
	turno <- Minusculas(turno)
	
	Escribir "Seleccione el tipo de lavado:"
	Escribir "1. Lavado profundo"
	Escribir "2. Tratamiento especial"
	Leer tipoLavado
	
	Escribir "Seleccione el tipo de vehículo:"
	Escribir "1. Automóvil"
	Escribir "2. 4x4 / SUV"
	Escribir "3. Camión"
	Escribir "4. Moto"
	Leer tipoVehiculo
	
	// Asignar precio base según tipo de lavado y vehículo
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
			Escribir "Opción inválida. Se asignará lavado profundo para automóvil por defecto."
			precioBase <- 9000
	FinSegun
	
	descuento <- 0
	
	// Descuento por horario
	Si turno = "noche" Entonces
		descuento <- descuento + 0.15
	Sino
		descuento <- descuento + 0.05
	FinSi
	
	// Descuento por tipo de placa (último carácter)
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
	
	// Descuento por día de la semana
	Si diaSemana = "lunes" O diaSemana = "martes" O diaSemana = "miércoles" O diaSemana = "jueves" O diaSemana = "viernes" Entonces
		descuento <- descuento + 0.10
	Sino
		descuento <- descuento + 0.03
	FinSi
	
	precioFinal <- precioBase - (precioBase * descuento)
	
	Escribir "Resumen de su lavado:"
	Escribir "Usuario: ", usuario
	Escribir "Correo: ", correo
	Escribir "Día: ", diaSemana
	Escribir "Turno: ", turno
	Escribir "Placa: ", placa
	Escribir "Tipo de lavado: ", tipoLavado
	Escribir "Tipo de vehículo: ", tipoVehiculo
	Escribir "Descuento aplicado: ", descuento * 100, "%"
	Escribir "Precio final: ", precioFinal
	
	Si respuestaFavorito = "si" Entonces
		Escribir "Auto favorito registrado:"
		Escribir "Placa: ", placaFavorita
		Escribir "Color: ", colorFavorito
		Escribir "Marca: ", marcaFavorita
FinSi

FinAlgoritmo
