class Jarra {
	
	var property capacidad = 0
	var property marca
	const property servidaEn 
	
	method contenidoDeAlcohol() {
		
		return self.marca().graduacionPorLitro() * capacidad
		
	}

}