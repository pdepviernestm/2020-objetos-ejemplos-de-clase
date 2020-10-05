ACME S.A. tiene una planta modelo en una bucólica zona rural lejos del tráfago urbano.

Para que la gente pueda llegar a la planta, la empresa tiene varios micros contratados. En cada micro
entran _n_ pasajeros sentados y _m_ parados, donde el _n_ y el _m_ son particulares de cada micro (no son
todos los micros iguales).

La gente no es toda igual, entonces para subirse a un micro se fija en distintas cosas:
- las personas **apuradas** se suben siempre
- las personas **claustrofóbicas** se suben sólo si el micro tiene más de 120 m3 de volumen (se sabe el
volumen de cada micro)
- las personas **fiacas** se suben sólo si entran sentados
- las personas **moderadas** se suben sólo si quedan al menos _x_ lugares libres (no importa si sentados o
parados), donde el x es particular de cada persona moderada.
- las personas **obsecuentes** toman la misma decisión que tomaría su jefe (de cada persona se sabe
quién es su jefe, que es otra persona).

Modelar a los micros y las personas de forma tal de
1) poder preguntarle a un micro si se puede subir a una persona, para lo cual tienen que darse
dos condiciones: que haya lugar en el micro, y que la persona acepte ir en el micro.

2) hacer que se suba una persona a un micro, si no puede, que tire error, donde "error" es
`self.error("mensaje de error como String")`

3) hacer que se baje una persona de un micro, si no se puede (porque está vacío), que tire error

4) poder preguntarle a un micro quién fue el primero que se subió, nil si está vacío. OJO si en
el micro hay una sola persona y se baja
