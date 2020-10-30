class Personaje {
	var rol
	var fuerza = 10
	
	method potencialOfensivo() = (fuerza * 10 + rol.potencialOfensivo())
	
	method esGroso() = self.esInteligente() or rol.esGroso(self)
	
	method esInteligente()
	method esFuerte() = fuerza > 50
}

class Orco inherits Personaje {
	override method potencialOfensivo() = super() * 1.1
	override method esInteligente() = false
}

class Humano inherits Personaje {
	var inteligencia
	override method esInteligente() = inteligencia > 50
}

// ROLES

object brujo {
	method potencialOfensivo() = 0
	method esGroso(personaje) = true
}

class Cazador {
	const mascota
	
	method potencialOfensivo() = mascota.potencialOfensivo()
	method esGroso(personaje) = mascota.esLongeva()
}

object guerrero {
	method potencialOfensivo() = 100
	method esGroso(personaje) = personaje.esFuerte()
}

//MASCOTA

class Mascota {
	const fuerza
	const tieneGarras
	const edad
	
	method potencialOfensivo() = if (tieneGarras) 2 * fuerza else fuerza
	method esLongeva() = edad > 10
}

//ZONAS

class Ejercito {
	const integrantes = []
	
	method potencialOfensivo() = integrantes.sum { personaje => personaje.potencialOfensivo() }
	
	method atacar(unaZona) {
		if (self.potencialOfensivo() > unaZona.potencialDefensivo()) {
			self.ocupar(unaZona)
		}
	}
	
	method ocupar(unaZona) {
		if (integrantes.size() > 10){
			const integrantesPalNuevoEjercito = self.losDiezMasCapos()
			integrantes.removeAll(integrantesPalNuevoEjercito)
			unaZona.esOcupadaPor(new Ejercito(integrantes = integrantesPalNuevoEjercito))
		} else {
			unaZona.esOcupadaPor(self)
		}
	}
	
	method losDiezMasCapos() { 
		const integrantesOrdenadosPorPotencialOfensivo = integrantes.sortedBy { unIntegrante, otroIntegrante => unIntegrante.potencialOfensivo() > otroIntegrante.potencialOfensivo() }
		return integrantesOrdenadosPorPotencialOfensivo.take(10)
	}
}

class Zona {
	var ejercito
	
	method potencialDefensivo() = ejercito.potencialOfensivo()
	method esOcupadaPor(unEjercito) { ejercito = unEjercito }
}

class Ciudad inherits Zona {
	override method potencialDefensivo() = super() + 300
}

//============

const hrrrrr = new Orco(rol = new Cazador(mascota = new Mascota(fuerza = 16, tieneGarras = true, edad=12)))
const oneManArmy = new Ejercito(integrantes = [hrrrrr])
const aldea = new Zona(ejercito = [])
const newYork = new Ciudad(ejercito = oneManArmy)


