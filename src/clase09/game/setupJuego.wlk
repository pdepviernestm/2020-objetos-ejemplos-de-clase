import wollok.game.*
import clase09.game.juegoGranja.*
import clase09.vaca.*
import clase09.gallina.*
import clase09.dispositivos.*
import clase09.granja.*

// TODO: reemplazar los "CosoConImagen" por los objetos reales a usar en el juego
// Además, implementar el método image() en los diferentes objetos para que se muestre la imagen correcta

class CosoConImagen {
	const property image
}

const vaca = new Vaca(peso=110)
const gallina = new Gallina()
const comedero = new Comedero(capacidadMaxima=30, racion=2)
const comederoRecargable = new ComederoRecargable(capacidadMaxima=80, racion=5, racionesEnStock=5)
const laGranja = new Granja(dinero=5000, puntaje=0)
// Nota: Al pasar el mouse por cada uno de los dispositivos o la granja, se va a mostrar su estado interno.
// Esto esta bueno para poder chequear rapido cuanto dinero tiene la granja o cuanto alimento tiene el comedero recargable

object configuracionJuego {
	const personaje = new PersonajeControlado(animal = gallina)
	method configurar(){
		self.configurarVentana()
		self.configurarVisuales()
	}
	method configurarVisuales(){
		self.configurarDispositivos()
		self.configurarGranja()
		self.configurarPersonaje()
	}
	method configurarVentana() {
		game.cellSize(100)
		game.width(10)
		game.height(7)
		game.title("Atención de Animales")
	}
	method configurarDispositivos() {
		const dispositivos = [comedero, comederoRecargable]
		game.addVisualIn(comedero, game.at(1,5))
		game.addVisualIn(comederoRecargable, game.at(4, 4))
		
		dispositivos.forEach {dispositivo =>
			game.showAttributes(dispositivo)
			game.onCollideDo(dispositivo, { animalControlado => 
				animalControlado.atenderEn(dispositivo)
			})
		}
	}
	method configurarGranja() {
		juegoGranja.granja(laGranja)
		game.addVisualIn(laGranja, game.at(game.width()-3, game.height()-3))
		game.showAttributes(laGranja)
	}
	method animal(animalAControlar) {
		personaje.animal(animalAControlar) 
	}
	method configurarPersonaje() {
		game.addVisualCharacterIn(personaje, game.origin())	

		keyboard.v().onPressDo({ self.animal(vaca) })
		keyboard.g().onPressDo({ self.animal(gallina) })
	}
}

class PersonajeControlado {
	var property animal
	method image() = animal.image()
	
	method atenderEn(dispositivo) {
		juegoGranja.seAtiende(animal, dispositivo)
	}
}

