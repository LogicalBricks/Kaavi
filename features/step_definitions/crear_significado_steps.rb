# -*- encoding : utf-8 -*-
Dado /^que se encuentra en el listado de significados$/ do
  visit significados_path
end

Dado /^se da accede a crear un nuevo significado$/ do
  click_on "Nuevo Significado" 
end

Cuando /^se introduce el nuevo significado$/ do
  @significado = 'nuevo'
  fill_in "Palabra", with: @significado
  click_on 'Guardar'
end

Entonces /^debe guardarse satisfactoriamente el significado$/ do
  page.should have_content("El significado fue guardado correctamente")
  significado = Significado.find_by_palabra(@significado) 
  significado.palabra.should == @significado
end

Dado /^que se encuentra en la página de creación o edición de palabra$/ do
  visit new_palabra_path 
end

Dado /^se da clic al botón agregar significado$/ do
  click_link 'Agregar significado'
end

Cuando /^se introduce el nuevo significado para la palabra$/ do
  @significado1 = 'nuevo1'
  within("div#agregar_significado") do
    fill_in 'Palabra', with: @significado1
  end
  click_on 'Agregar'
end

Entonces /^debe guardarse satisfactoriamente$/ do
  wait_until { page.should have_content('El significado fue guardado correctamente') }
  significado = Significado.find_by_palabra(@significado1) 
  significado.should_not be_nil
  significado.palabra.should == @significado1
end
