
class Micro {
		
	var property maximoPersonasSentadas 
	var property maximoPersonasParadas
	var personasQueSeSubieron = 0

	method puedeSubir(unaPersona) {
		return self.hayLugar() and unaPersona.quiereSubirseEn(self)
	}
	
	method hayLugar() {
		return self.quedanLugares(1);
	}
	
	method quedanLugares(unaCantidad) {
		return self.cuantosLugaresLibresQuedan() >= unaCantidad
	}
	
	method subirA(unaPersona) {
		if (self.puedeSubir(unaPersona)) {
			personasQueSeSubieron++ 	
		} else {
			self.error("no se puede subir")
		}
	}
	
	method cuantosLugaresLibresQuedan() {
		return maximoPersonasParadas + maximoPersonasSentadas - personasQueSeSubieron
	}
}

