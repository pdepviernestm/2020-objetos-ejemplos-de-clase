import clase09.game.prompts.*
import wollok.game.*
import clase09.game.setupJuego.*
import clase09.exceptions.*

object juegoGranja {
	var property granja

	method seAtiende(animal, dispositivo) {	
		try {
			granja.atenderCon(dispositivo, animal)			
		} catch error: NoHayMasAlimentoEnStockException {
			new PromptRecargar(recargable=dispositivo).mostrar()
		} catch error: DomainException {
			throw error // dejamos que siga su curso y wollok game lo maneje
		} catch error: Exception {
			promptError.mostrar() // esto va a hacer que cierre el juego, va a atrapar las Exception que NO sean DomainException porque esas ya se atraparon arriba
		}
	}

	method recargar(dispositivoRecargable) {
		granja.recargar(dispositivoRecargable)
	}
}
