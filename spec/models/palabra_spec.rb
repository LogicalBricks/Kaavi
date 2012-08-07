# -*- encoding : utf-8 -*-
require 'spec_helper'

describe 'Palabra' do
  it 'debe crear una palabra sin relaciones' do
    palabra = FactoryGirl.create(:palabra).should be_valid
  end

  it 'debe crear una palabra con una traduccion' do
    palabra = FactoryGirl.create(:palabra_con_traduccion).should be_valid
  end

  it 'debe crear una palabra con múltiples traducciones' do
    palabra = FactoryGirl.create(:palabra_con_traducciones).should be_valid
  end

  it 'no debe crear una palabra vacía' do
    palabra = FactoryGirl.build(:palabra, palabra: '').should_not be_valid
  end 
end
