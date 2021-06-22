import Jarras.*
import Cervezas.*
import Carpas.*

class Persona {
	
	var property peso = 0
	const property jarrasCompradas = []
	var property escuchaMusicaTradicional = false
	var property nivelAguante = 0
	var property paisDeNacimiento
	
	method paisDeNacimiento() {
		
		return paisDeNacimiento
		
	}
	
	method comprarJarra(unaJarra) {
		
		jarrasCompradas.add(unaJarra)
		
	}
	
	method estaEbria() {
		
		return (self.totalDeAlcoholIngerido() * peso) > nivelAguante	
		
	}
	
	method leGusta(unaMarca) {
		
		return true
		
	}
	
	method quiereEntrar(unaCarpa) {
		
		return self.leGusta(unaCarpa.marcaVendida()) and 
			   unaCarpa.cumplePreferenciaMusicaDe(self)
			   
	}
	
	method puedeEntrar(unaCarpa) {
		
		return self.quiereEntrar(unaCarpa) and unaCarpa.dejaIngresar(self)
		
	}
	
	method entrarA(unaCarpa) {
		
		return if(self.puedeEntrar(unaCarpa)) {
			
		 			unaCarpa.personasDentro().add(self)
			
				}
				
				else {
				
					self.error("No puede ingresar a la carpa.")
				
				}
		
	}
	
	method totalDeAlcoholIngerido() {
		
		return jarrasCompradas.sum({ j => j.contenidoDeAlcohol() })
		
	}
	
	method esPatriota() {
		
		return jarrasCompradas.all({ j => j.marca().pais() == paisDeNacimiento })
		
	}
	
	method esEbrioEmpedernido() {
		
		return jarrasCompradas.all({ j => j.capacidad() >= 1 })
		
	}
	
	method esCompatibleCon(unaPerona) {
		
		const coincidencias = self.marcasCompradas().intersection(unaPerona.marcasCompradas())
		const listaDiferencia1 = self.marcasCompradas().difference(unaPerona.marcasCompradas())
		const listaDiferencia2 = unaPerona.marcasCompradas().difference(self.marcasCompradas())
		const diferencias =  listaDiferencia1.union(listaDiferencia2)
		return coincidencias.size() > diferencias.size()
		
	}
	
	method marcasCompradas() {
		
		return self.jarrasCompradas().map( { j => j.marca() } ).asSet()

	}
	
	method carpasQueLeSirvieron() {
		
		return self.jarrasCompradas().map( { j => j.servidaEn() } ).asSet()

	}
	
}

class Belga inherits Persona {
	
	override method paisDeNacimiento() { return "Belgica" }
		
	override method leGusta(unaMarca) {
		
		return unaMarca.lupulo() > 4
		
	}
	
	
}

class Checo inherits Persona {
		
	override method paisDeNacimiento() { return "Rep.Checa" }
	
	override method leGusta(unaMarca) {
		
		return unaMarca.graduacionPorLitro() > 0.08
		
	}
	
}

class Aleman inherits Persona {

	override method paisDeNacimiento() { return "Alemania" }
	
	override method quiereEntrar(unaCarpa) {
			
		return super(unaCarpa) and
			   unaCarpa.cantidadDePersonas().even() 
			  	   
	}
	
}
	  