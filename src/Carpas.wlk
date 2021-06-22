import Cervezas.*
import Jarras.*
import Personas.*

class Carpa {
	
	var property limiteGente = 0
	var property tieneBanda = false
	var property marcaVendida
	const property personasDentro = []
	
	method hayBanda() {
		
		return tieneBanda
		
	}
	
	method cantidadDePersonas() {
		
		return personasDentro.size()
		
	}
	
	method cumplePreferenciaMusicaDe(unaPersona) {
		
		return 	
			if(unaPersona.escuchaMusicaTradicional()) { self.hayBanda() }
			else {not self.hayBanda()}
		
	}
	
	method dejaIngresar(unaPersona) {
		
		return not unaPersona.estaEbria() and self.cantidadDePersonas() != self.limiteGente()
		
	}
	
	method estaDentroDeLaCarpa(unaPersona) {
		
		return personasDentro.contains(unaPersona)
		
	}
	
	method servirJarraADe(unaPersona, capacidadJarra) {
		
		var jarra
		
		if (self.estaDentroDeLaCarpa(unaPersona)) {
			
			jarra = new Jarra(capacidad = capacidadJarra, marca = self.marcaVendida(), servidaEn = self)
			unaPersona.jarrasCompradas().add(jarra)
		
		} 
		
		else {
			
			self.error("Nadie quiere.")
		
		}
	}
	
	method cantidadDeEbriosEmpedernidos() {
		
		return personasDentro.count({ p => p.esEbrioEmpedernido()})
		
	}
	
	method esHomogenea() {
		
		return personasDentro.map({ p => p.paisDeNacimiento() }).asSet().size() == 1
		
	}
	
	method noSirvioA() { 
		
		return self.personasDentro().filter({ p => not p.carpasQueLeSirvieron().contains(self) })
	
	}
	
}
