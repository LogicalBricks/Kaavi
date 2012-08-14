# -*- encoding : utf-8 -*-

Dado /^que se cuenta con al menos una palabra$/ do
  @palabras = [
  FactoryGirl.create(:palabra),
  FactoryGirl.create(:palabra_con_traduccion, palabra: 'savi'),
  FactoryGirl.create(:palabra_con_traducciones, palabra: 'kuta')
  ] 
end

Cuando /^se accede a la página de listado de palabras$/ do
  visit palabras_path
end

Entonces /^se deben mostrar todas las palabras y los botones correspondientes$/ do
  @palabras.each do |palabra|
   page.should have_content(palabra.palabra)
    #page.has_link?('Mostrar', href: "/palabras/#{palabra.id}").should be_true
    page.has_link?('Editar', href: "/palabras/#{palabra.id}/edit").should be_true
    page.has_link?('Eliminar', href: "/palabras/#{palabra.id}").should be_true
    page.has_link?('Variante', href: "/palabras/#{palabra.id}/variantes/new").should be_true
  end
end

Dado /^que no se cuenta con palabras$/ do
   
end

Entonces /^se deben mostrar un mensaje de que no existen palabras$/ do
  page.should have_content("No se encontraron Palabras")
end
