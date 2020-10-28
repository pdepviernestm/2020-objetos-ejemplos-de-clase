class Estudiante {
  const energia = 0
  var property horasDeEstudio = 0
  var property estresado = false

  method concentracion() = if(estresado) energia / 2 else energia

  method concentrado() = self.concentracion() > 50

  method preparado() = horasDeEstudio > 40 && self.concentrado()

}

