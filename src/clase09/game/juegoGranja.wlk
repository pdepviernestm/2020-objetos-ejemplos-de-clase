import clase09.game.prompts.*
import wollok.game.*
import clase09.game.setupJuego.*

object juegoGranja {
	method seAtiende(animal, dispositivo) {	
		self.error("Falta implementar")
		// TODO:
		// hacer que la granja atienda a un animal con ese dispositivo

		// Queremos que si la atencion falla porque no habia suficiente alimento para un animal en un dispositivo recargable,
		// nos muestre el prompt de recarga de alimento, 
		// lo cual se puede hacer con: new PromptRecargar(elDispositivoRecargable).mostrar()
		
		// También queremos que si sucede cualquier error que no contemplamos en el dominio, se muestre el prompt
		// de que algo salió mal, lo cual se puede hacer con: promptError.mostrar()
	}

	method recargar(dispositivoRecargable) {
		self.error("Falta implementar")
		// TODO:
		// hacer que la granja recargue al dispositivo recargable
	}
}
