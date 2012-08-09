# -*- encoding : utf-8 -*-

Dado /^que se encuentra en la página para introducir la nueva palabra$/ do
  visit new_palabra_path 
end

Cuando /^se introduce una palabra válida con sus significados$/ do
  fill_in 'Palabra', with: 'davi'
  fill_in 'Lugar', with: 'mixteca baja'
  #fill_in 'select2-default', with: 'lluvia'
  click_button 'Guardar'
end

Entonces /^debe guardar correctamente la palabra$/ do
  page.should have_content("La palabra fue guardada correctamente")
end

Dado /^que se cuenta con palabras con significados comunes$/ do
  traduccion= FactoryGirl.create(:traduccion, significado: FactoryGirl.create(:significado, palabra: 'lluvia'))
  @palabra = FactoryGirl.create(:palabra, traducciones: [traduccion] ) 
end

Cuando /^se escribe un significado común$/ do
  assert false 
end

Entonces /^debe mostrar las variantes asociadas al significado$/ do
  pending # express the regexp above with the code you wish you had
end


