
class Ave {
	var energia
	var ciudad
	
	method volarA(otraCiudad) {
		energia -= ciudad.distanciaHasta(otraCiudad)
		ciudad = otraCiudad
	}
	
	method energia() = energia
	method ciudad() = ciudad
}

