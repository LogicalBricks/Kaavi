# language: es
@javascript

Característica: Editar la palabra del diccionario
  Al acceder al listado de palabras y seleccionar el botón de editar
  debe permitir modificar sus significados, lugar y palabra 

  Escenario: Permitir edición exitosa de una palabra
    Dado que se tiene una palabra creada 
    Cuando se entra a la página de editar, se modifiquen los valores
    Y se presione el botón de aceptar
    Entonces se deben mostrar el mensaje de modificación exitosa
