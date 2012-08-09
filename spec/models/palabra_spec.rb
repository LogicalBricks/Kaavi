# -*- encoding : utf-8 -*-
require 'spec_helper'

describe 'Palabra' do
  it 'debe crear una palabra sin relaciones' do
    palabra = FactoryGirl.create(:palabra).should be_valid
  end

  it 'debe crear una palabra con una traduccion' do
    palabra = FactoryGirl.create(:palabra_con_traduccion).should be_valid
  end

  it 'debe crear una palabra con base a sus significados' do
    significados = [ FactoryGirl.create(:significado), FactoryGirl.create(:significado) ]
    palabra = FactoryGirl.build(:palabra)
    palabra.significados = "#{significados[0].id},#{significados[1].id}"
    palabra.save.should be_true
  end

  it 'debe crear una palabra con múltiples traducciones' do
    palabra = FactoryGirl.create(:palabra_con_traducciones).should be_valid
  end

  it 'no debe crear una palabra vacía' do
    palabra = FactoryGirl.build(:palabra, palabra: '').should_not be_valid
  end 

  it 'no debe crear una palabra con significados repetidos' do
    significado = FactoryGirl.create(:significado)
    traducciones = [FactoryGirl.build(:traduccion, significado: significado), FactoryGirl.build(:traduccion, significado: significado)]
    palabra = FactoryGirl.build(:palabra, traducciones: traducciones).should_not be_valid
  end
end
