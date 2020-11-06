# Atención de Animales

# Parte I: El modelado

Esta parte va a ser la más larga, vamos a implementar el modelo descripto a continuación, prestando especial atención a en que lugares convendría lanzar errores.

## Animales

En un campo hay que alimentar a los animales. Consideremos vacas y gallinas, que tienen estas características.

**Vaca**

* Cuando come aumenta el peso en lo que comió / 3.
* Tiene hambre si pesa menos de 200 kg.	

**Gallina**

* Cuando come no se observa ningún cambio, siempre pesa 4 kg.
* Además, siempre tiene hambre.

## Dispositivos

También hay distintos dispositivos de atención automática a los animales:

* Comederos: cada comedero da de comer una cantidad fija que deberá indicarse para cada dispositivo. Son útiles para atender a los animales con hambre que pesen menos de lo que soporta el comedero. Debemos considerar que **no debería ser posible atender en un comedero a animales que pesen más que lo que el dispositivo soporta**.
* Comederos Recargables: Deberían comportarse como comederos normales, pero tienen una cantidad de raciones en stock que disminuye en uno cada vez que da de comer a un animal. Además, queremos poder recargarle una cantidad de comida (en kgs), lo cual debería aumentar la cantidad de raciones en stock según cuantas raciones representa esa cantidad de comida.

Modelar lo que se describió de forma tal de poder:

* Saber si un dispositivo es útil para atender a un animal.
* Hacer que un animal se atienda en un dispositivo.

Algunas preguntas como para pensar con que tests podriamos arrancar:
- ¿Es util un comedero para un animal que no tiene hambre?
  - ¿Cuando tiene hambre una vaca?¿Y una gallina?
- ¿Es util un comedero para atender a un animal que pesa menos de lo que soporta? ¿Y el caso contrario? ¿Y si pesa lo mismo?

## La granja

Queremos representar a la granja en la que se encuentran estos dispositivos y animales.
De la granja nos va a interesar el dinero con el que cuenta y el puntaje que tiene, y la forma en la que va a gastar dinero y obtener puntaje es dando atención a animales con los diferentes dispositivos.
Cuando la granja le da atención a un animal con un dispositivo:

- El dispositivo atiende al animal
- Si la atención pudo realizarse, gasta tanto dinero como el consumo energético del dispositivo y gana 5 puntos si el dispositivo era útil para atender al animal y 1 si no.
- Si la atención no fue exitosa, además de fallar por ese motivo, resta 3 puntos por mala atención.

Además, queremos poder hacer que la granja recargue un comedero recargable, lo que hace que gaste 500 de dinero para recargar 20kgs de comida a ese dispositivo.

### ¿Consumo energético?

Cada dispositivo tiene un consumo energético que necesitamos conocer para saber cuanto le va a costar a la granja atender a un animal.
El consumo energético de un comedero es 20 * el peso máximo que soporta y el de un comedero recargable es 2 * el stock de raciones que tenga en ese momento.

## Parte II: El juego

En el juego vamos a tener un animal que lo podemos mover con las flechas.
Cuando el animal colisiona con un dispositivo, se le manda a juegoGranja que haga que la granja lo atienda con ese dispositivo.
Además, podemos cambiar de animal usando v para usar a la vaca y g para la gallina.

La mayor parte de la interfaz del juego está resuelta, lo que hay que hacer es:
- Crear los objetos a usar en setupJuego.wlk
- Implementar los dos métodos de juegoGranja


