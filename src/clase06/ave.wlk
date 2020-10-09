class Ave {
	var energia
	var ciudad
	method volarA(otraCiudad) {
		if(self.energiaRequeridaParaVolarA(otraCiudad) > energia) {
		self.error("No tengo energia suficiente para volar")
	}
	energia -= ciudad.distanciaHasta(otraCiudad)
	ciudad = otraCiudad
	}
	method energiaRequeridaParaVolarA(otraCiudad) = ciudad.distanciaHasta(otraCiudad)
	method energia() = energia
	method ciudad() = ciudad
}



	