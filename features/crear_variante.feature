# language: es
@javascript

Característica:Crear una variante 
  El usuario podrá introducir una nueva variante a una palabra
  introduciendo la variante pertinente.

  Escenario: Crear una variante a través del listado de palabras
    Dado que se tiene al menos una palabras con multiples significados
    Y que se encuentra en el listado de palabras
    Cuando se le de click en el botón para agregar variante
    Y se introduzca la nueva variante
    Entonces debe guardarse satisfactoriamente la variante
    Y la variante debe tener los mismos significados que la palabra elegida
