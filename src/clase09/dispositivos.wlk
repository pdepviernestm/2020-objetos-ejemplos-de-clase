import clase09.exceptions.*

class Comedero {
	const capacidadMaxima
	const racion

	method image() = "clase09/comedero.png"
	
	method esUtilPara(animal) =
		animal.peso() < capacidadMaxima && animal.tieneHambre()
		
	method atender(animal) {
		self.validarAtencion(animal)
		animal.comer(racion)
	}
	
	method validarAtencion(animal) {
		if(animal.peso() > capacidadMaxima)
			throw new NoSePudoAtenderException(message="No se puede atender al animal porque excede la capacidad del comedero")
	}
	
	method consumo() = capacidadMaxima * 20
}

class ComederoRecargable inherits Comedero {
	var racionesEnStock = 0
	method racionesEnStock() = racionesEnStock
	
	override method image() = "clase09/comedero_recargable.png"
	
	override method atender(animal) {
		super(animal)
		racionesEnStock -= 1
	}

	method recargar(kilosDeComida) {
		racionesEnStock += kilosDeComida / racion
	}
	
	override method validarAtencion(animal) {
		super(animal)
		if(racionesEnStock == 0)
			throw new NoHayMasAlimentoEnStockException(message="Un comedero recargable no puede atender sin raciones en stock")
	}
	
	override method consumo() = racionesEnStock * 2
}
