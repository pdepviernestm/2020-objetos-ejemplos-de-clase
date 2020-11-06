import wollok.game.*
import clase09.game.juegoGranja.*

// TODO: reemplazar los "CosoConImagen" por los objetos reales a usar en el juego
// Además, implementar el método image() en los diferentes objetos para que se muestre la imagen correcta

class CosoConImagen {
	const property image
}

const vaca = new CosoConImagen(image="clase09/vaca.png")// una vaca que pesa 110kg
const gallina = new CosoConImagen(image="clase09/gallina.png")// una gallina
const comedero = new CosoConImagen(image="clase09/comedero.png")//un comedero que soporta maximo 30kgs y cuya racion es de 2
const comederoRecargable = new CosoConImagen(image="clase09/comedero_recargable.png")//un comedero recargable que soporta maximo 80kgs, cuya racion es de 5 y que cuenta con 5 stocks al iniciar
const bebedero = new CosoConImagen(image="clase09/bebedero.png")//un bebedero
const laGranja = new CosoConImagen(image="clase09/granja.png")//la granja

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
		const dispositivos = [comedero, comederoRecargable, bebedero]
		game.addVisualIn(comedero, game.at(1,5))
		game.addVisualIn(bebedero, game.at(2, 2))
		game.addVisualIn(comederoRecargable, game.at(4, 4))
		
		dispositivos.forEach {dispositivo =>
			game.showAttributes(dispositivo)
			game.onCollideDo(dispositivo, { animalControlado => 
				animalControlado.atenderEn(dispositivo)
			})
		}
	}
	method configurarGranja() {
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

