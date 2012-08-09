# language: es
@javascript

Característica: Listar las palabras del diccionario
  Al acceder al listado de palabras debe mostrarse las opciones 
  de manejo de las mismas, incluyendo agregar variantes.

  Escenario: Listar palabras
    Dado que se cuenta con al menos una palabra
    Cuando se accede a la página de listado de palabras
    Entonces se deben mostrar todas las palabras y los botones correspondientes

  Escenario: Listado vacío 
    Dado que no se cuenta con palabras
    Cuando se accede a la página de listado de palabras
    Entonces se deben mostrar un mensaje de que no existen palabras


