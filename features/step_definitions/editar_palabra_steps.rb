# -*- encoding : utf-8 -*-
Dado /^que se tiene una palabra creada$/ do
  @palabra = FactoryGirl.create(:palabra_con_traducciones)
end

Cuando /^se entra a la página de editar, se modifiquen los valores$/ do
  visit edit_palabra_path(@palabra)
  fill_in 'Palabra', with: 'Vee'
  fill_in 'Lugar', with: 'Mixtca Alta'
end

Cuando /^se presione el botón de aceptar$/ do
  click_button 'Guardar'
end

Entonces /^se deben mostrar el mensaje de modificación exitosa$/ do
  page.should have_content('La Palabra fue actualizada correctamente')
end
