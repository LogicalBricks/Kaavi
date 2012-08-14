# language: es
@javascript

Característica: Agregar nuevo significado
  El usuario podrá introducir un nuevo significado al diccionario

  Escenario: Introducir un nuevo significado de forma normal
    Dado que se encuentra en el listado de significados
    Y se da accede a crear un nuevo significado
    Cuando se introduce el nuevo significado
    Entonces debe guardarse satisfactoriamente el significado

  Escenario: Introducir un nuevo significado desde la creación o edición de palabra
    Dado que se encuentra en la página de creación o edición de palabra
    Y se da clic al botón agregar significado
    Cuando se introduce el nuevo significado para la palabra
    Entonces debe guardarse satisfactoriamente


