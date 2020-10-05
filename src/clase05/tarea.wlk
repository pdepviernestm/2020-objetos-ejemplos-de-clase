import clase05.estados.*

class Tarea {
	const property descripcion
	const property fechaLimite
	var property estado
	const etiquetas = new Set()
	
	method pendiente() = estado != terminada && estado != cancelada
	
	method atrasadaPara(unaFecha) = self.pendiente() && unaFecha > fechaLimite
	
	method tieneEtiqueta(etiqueta) = etiquetas.contains(etiqueta)
	
	method agregarEtiqueta(etiqueta) {
		etiquetas.add(etiqueta)
	}
}

