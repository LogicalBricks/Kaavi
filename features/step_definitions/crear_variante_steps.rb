# -*- encoding : utf-8 -*-
Dado /^que se tiene al menos una palabras con multiples significados$/ do
  @palabra = FactoryGirl.create(:palabra_con_traducciones)
end

Dado /^que se encuentra en el listado de palabras$/ do
  visit palabras_path
end

Cuando /^se le de click en el botón para agregar variante$/ do
  click_link 'Variante'
end

Cuando /^se introduzca la nueva variante$/ do
  @nueva = 'asd'
  fill_in 'Palabra', with: @nueva
  fill_in 'Lugar', with: ''
  click_button 'Guardar'
end

Entonces /^la variante debe tener los mismos significados que la palabra elegida$/ do
  pending # express the regexp above with the code you wish you had
end

Entonces /^debe guardarse satisfactoriamente la variante$/ do
  pending # express the regexp above with the code you wish you had
end
