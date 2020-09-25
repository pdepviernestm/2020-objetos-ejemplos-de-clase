ACME S.A. tiene una planta modelo en una bucólica zona rural lejos del tráfago
 urbano.
Para que la gente pueda llegar a la planta, la empresa tiene varios micros contratados. En cada micro
entran __n__ pasajeros sentados y __m__ parados, donde el __n__ y el __m__ son particulares de cada micro (no son
todos los micros iguales).

La gente no es toda igual, entonces para subirse a un micro se fija en distintas cosas:
- los apurados se suben siempre
- los claustrofóbicos se suben sólo si el micro tiene más de 120 m3 de volumen (se sabe el
volumen de cada micro)
- los fiacas se suben sólo si entran sentados
- los moderados se suben sólo si quedan al menos x lugares libres (no importa si sentados o
parados), donde el x es particular de cada persona moderada.


• los obsecuentes toman la misma decisión que tomaría su jefe (de cada empleado se sabe
quién es su jefe, que es otro empleado).

Modelar a los micros y las personas de forma tal de
1) poder preguntarle a un micro si se puede subir a una persona, para lo cual tienen que darse
dos condiciones: que haya lugar en el micro, y que la persona acepte ir en el micro.


2) hacer que se suba una persona a un micro, si no puede, que tire error, donde "error" es
`self.error("mensaje de error como String")`

3) hacer que se baje una persona de un micro, si no se puede (porque está vacío), que tire error

4) poder preguntarle a un micro quién fue el primero que se subió, nil si está vacío. OJO si en
el micro hay una sola persona y se baja