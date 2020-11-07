
class Vaca {
	var peso
	
	method image() = "clase09/vaca.png"
	
	method peso() = peso
	method tieneHambre() = peso < 200
	
	method comer(kilosDeComida) {
		peso += kilosDeComida / 3
	}
}

