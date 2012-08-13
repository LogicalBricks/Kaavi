require 'spec_helper'

describe PalabraDecorator do

  before(:each) do
    @palabra_con_traducciones = FactoryGirl.create(:palabra_con_traduccion)
    @palabra = PalabraDecorator.find(@palabra_con_traducciones.id)
  end

  it 'should return empty json file' do
    pending
    palabra_vacia = FactoryGirl.create(:palabra)
    palabra_vacia.significados_json.should == 'null'
  end

  it 'should return an json file with data' do
    @palabra.significados_json.should_not == 'null'
  end

  it 'should return test1, test2, test3' do
    pending
    @palabra.significados_id_comma.should == 'test1, test2, test3'
  end

  it 'should relacionar_variante' do
    pending
    variante = "algo"
    @palabra.relacionar_variante(variante).should == nil
  end

  it 'should not relacionar_variante' do
    pending
    @palabra.relacionar_variante(variante).should_not == nil
  end

  it 'should return a Palabra model' do
    nombre = @palabra_con_traducciones.palabra
    @palabra.palabra.should == nombre
  end
end
