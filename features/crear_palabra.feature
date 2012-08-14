# language: es
@javascript

Característica: Agregar nueva palabra al diccionario
  El usuario podrá introducir una nueva palabra al diccionario
  introduciendo la Palabra, el lugar y los significados de la 
  palabra.

  Escenario: Introducir una nueva palabra
    Dado que se cuenta con al menos dos significados
    Y que se encuentra en la página para introducir la nueva palabra
    Cuando se introduce una palabra válida con sus significados
    Entonces debe guardar correctamente la palabra

  Escenario: Introducir una nueva palabra agregando audio
    Dado que se encuentra en la página para introducir la nueva palabra
    Cuando se introduce una palabra válida con sus significados incluyendo audio
    Entonces debe guardar correctamente la palabra con el audio


  Escenario: Mostrar variantes asociadas a la palabra
    Dado que se cuenta con palabras con significados comunes
    Y que se encuentra en la página para introducir la nueva palabra
    Cuando se escribe un significado común 
    Entonces debe mostrar las variantes asociadas al significado


