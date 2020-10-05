
class PersonaModerada {
	
	var property minimoEspacioDisponible
	
	method quiereSubirseEn(unMicro) {
		return unMicro.quedanLugares(minimoEspacioDisponible);
	}
}

