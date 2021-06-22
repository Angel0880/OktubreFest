class Cerveza {
	
	var property lupulo = 0 
	var property pais
	var property porcentajeAlcohol = 0
	
	method graduacionPorLitro() {
		
		return porcentajeAlcohol / 100	
	
	}

}

class CervezaRubia inherits Cerveza {

	var property graduacionPorLitro = 0
	
	override method graduacionPorLitro() {
		
		return graduacionPorLitro
		
	}
	
}

class CervezaNegra inherits Cerveza {
	
	var property graduacionMundial
	
	override method graduacionPorLitro() {
		
		return graduacionMundial.min(self.lupulo() * 2 / 100)
		
	}
	
}

class CervezaRoja inherits Cerveza {
	
	override method graduacionPorLitro() {
		
		return super() * 1.25
		
	}	
	
}