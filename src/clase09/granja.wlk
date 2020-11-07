import clase09.exceptions.*

class Granja {
	var property dinero
	var property puntaje
	
	method image() = "clase09/granja.png"
	
	method atenderCon(dispositivo, animal) {
		try {
			const puntajeAGanar = self.puntajeQueGanaria(dispositivo, animal)
			self.validarAtencionCon(dispositivo)
			dispositivo.atender(animal)
			dinero -= dispositivo.consumo()
			puntaje += puntajeAGanar	
		} catch error : NoSePudoAtenderException {
			puntaje -= 3
			throw error
		}
	}
	
	method puntajeQueGanaria(dispositivo, animal) = if(dispositivo.esUtilPara(animal)) 5 else 1
	
	method recargar(dispositivoRecargable) {
		const costoDeRecargar = 500
		self.validarSiPuedeGastarPara(costoDeRecargar, "recargar un dispositivo")
		dispositivoRecargable.recargar(20)
		dinero -= costoDeRecargar
	}
	
	method validarAtencionCon(dispositivo) {
		self.validarSiPuedeGastarPara(dispositivo.consumo(), "atender un animal")
	}
	
	method validarSiPuedeGastarPara(cantidad, nombreDeAccion) {
		if(cantidad > dinero)
			self.error("No hay suficientes fondos para " + nombreDeAccion + ". Se quería gastar " + cantidad.toString() + " pero la granja tiene " + dinero.toString())
	}
}

