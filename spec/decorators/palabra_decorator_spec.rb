require 'spec_helper'

describe PalabraDecorator do

  before(:each) do
    @palabra_con_traducciones = FactoryGirl.create(:palabra_con_traducciones)
    @palabra = PalabraDecorator.find(@palabra_con_traducciones.id)
  end

  it 'should return empty json file' do
    palabra_vacia = FactoryGirl.create(:palabra, palabra: "Palabra")
    palabra_vacia.significados_json.should == 'null'
  end

  it 'should return an json file with data' do
    @palabra.significados_json.should_not == 'null'
  end

  it 'should 1,2' do
    @palabra.significados_id_comma.should == '1,2'
  end

  it 'should return a Palabra model' do
    nombre = @palabra_con_traducciones.palabra
    @palabra.palabra.should == nombre
  end
end
