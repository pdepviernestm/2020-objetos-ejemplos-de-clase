const moverse = { return "movi3" }

class Cargable {
	const cantidad
	method cargar() = "me cargo"
}

class Animal {
	method moverse() = moverse.apply()
}

class Perro inherits Animal {
	method ladrar() = "woof"
}

//YAGNI

class Gato inherits Animal {
	method maullar() ="miau"
}

class Robot {
	method cargar() = new Cargable(cantidad = 123).cargar()
}

class RobotCocina inherits Robot {
	method cocinar() = "hago risotto"
}

class RobotLimpieza inherits Robot {
	method limpiar() = "limpiar"
}

class Roomba inherits RobotLimpieza {
	method moverse() = moverse.apply()
}



