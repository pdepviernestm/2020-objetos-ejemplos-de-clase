import clase05.tarea.*
import clase05.estados.*

class Agenda {
	const tareas = []
	var filtro = { unaTarea => true }
	
	method tareasFiltradas() = tareas.filter(filtro)
	
	method cantidadTareas() = self.tareasFiltradas().size()
	
	method agendar(unaDescripcion, unaFechaLimite) {
		const nuevaTarea = new Tarea(descripcion=unaDescripcion,
									 fechaLimite=unaFechaLimite,
									 estado=paraHacer)

		if(self.tieneTarea(unaDescripcion)) self.borrar(unaDescripcion)	

		tareas.add(nuevaTarea)
	}
	
	method tieneTarea(unaDescripcion) =
		tareas.any { unaTarea => unaTarea.descripcion() == unaDescripcion} 
	
	method tarea(unaDescripcion) = tareas.find {
		unaTarea => unaTarea.descripcion() == unaDescripcion
	}
	
	method borrar(unaDescripcion) = tareas.remove(self.tarea(unaDescripcion))
	
	method descripciones() = self.tareasFiltradas().map { unaTarea => unaTarea.descripcion() }
	
	method tareaMasUrgente() {
		return self.tareasFiltradas()
					.filter { unaTarea => unaTarea.pendiente() }
				    .min { unaTarea => unaTarea.fechaLimite() }
	}
	
	method limpiar() {
		tareas.removeAllSuchThat { tarea => not tarea.pendiente() }
	}
	
	method filtradaPorEtiqueta(unaEtiqueta) {
		filtro = { unaTarea => unaTarea.tieneEtiqueta(unaEtiqueta) }
	}
}

