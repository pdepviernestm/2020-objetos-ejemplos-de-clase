import bonoporresultadonulo.*
import clase02.gerente.*
import clase02.bonodemontofijo.*
import clase02.bonoporporcentaje.*

object pepe {
	var property categoria
	var property bonoPorResultado = bonoPorResultadoNulo
	method sueldo() {
		return categoria.neto() + self.extraDeBonoPorResultado()
	}
	
	method extraDeBonoPorResultado() {
		return bonoPorResultado.extra(categoria.neto())
	}
}

