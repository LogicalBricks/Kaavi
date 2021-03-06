# -*- encoding : utf-8 -*-

Dado /^que se encuentra en la página para introducir la nueva palabra$/ do
  visit new_palabra_path 
end

Dado /^que se cuenta con al menos dos significados$/ do
  @significados = [ FactoryGirl.create(:significado), FactoryGirl.create(:significado) ]
end

Cuando /^se introduce una palabra válida con sus significados$/ do
  @texto= 'davi'
  fill_in 'Palabra', with: @texto
  fill_in 'Lugar', with: 'mixteca baja'
  page.execute_script("$('#significados').val(#{@significados.collect(&:id).to_json}).trigger('change')")
  click_button 'Guardar'
end

Entonces /^debe guardar correctamente la palabra$/ do
  page.should have_content("La palabra fue guardada correctamente")
  palabra = Palabra.find_by_palabra(@texto) 
  palabra.traducciones.collect(&:significado_id).should =~ @significados.collect(&:id)
end

Dado /^que se cuenta con palabras con significados comunes$/ do
  @significado = FactoryGirl.create(:significado, palabra: 'lluvia')
  traduccion= FactoryGirl.create(:traduccion, significado: @significado)
  @palabra = FactoryGirl.create(:palabra, traducciones: [traduccion] ) 
end

Cuando /^se escribe un significado común$/ do
  page.execute_script("$('#significados').val([#{@significado.id}]).trigger('change')")
end

Entonces /^debe mostrar las variantes asociadas al significado$/ do
  pending "Falta la implementación de la generación de las variantes asociadas"
  page.should have_content("Variante(s):#{@palabra.palabra}")
end

Cuando /^se introduce una palabra válida con sus significados incluyendo audio$/ do
  @archivo_path = File.join(Rails.root,'spec','uploads','prueba.txt')
  @texto1= 'davi'
  fill_in 'Palabra', with: @texto1
  fill_in 'Lugar', with: 'mixteca baja'
  attach_file 'palabra_audio', @archivo_path
  click_button 'Guardar'
end

Entonces /^debe guardar correctamente la palabra con el audio$/ do
  page.should have_content("La palabra fue guardada correctamente")
  palabra = Palabra.find_by_palabra(@texto1) 
  FileUtils.compare_file(palabra.audio.current_path, @archivo_path).should be_true
end

