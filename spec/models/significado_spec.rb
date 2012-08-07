# -*- encoding : utf-8 -*-
require 'spec_helper'

describe 'Significado' do
  it 'debe crear un significado sin relaciones' do
    significado = FactoryGirl.create(:significado).should be_valid
  end

  it 'no debe crear un significado vacío' do
    palabra = FactoryGirl.build(:significado, palabra: '').should_not be_valid
  end 
end
