class VariantesController < ApplicationController
  def index
  end

  def new
    @variante = Palabra.new
    @palabra = Palabra.find(params[:palabra_id])
    
    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @variante } 
    end 
  end

  def create
    @palabra = Palabra.find(params[:palabra_id])
    @variante = Palabra.new(params[:variante])
    @variante.relacionar_variante(@palabra)      
    respond_to do |format|
      if @variante.save
        format.html { redirect_to @variante, notice: 'La variante fue guardada correctamente.' }
        format.json { render json: @variante, status: :created, location: @variante}
      else
        format.html { render action: "new" }
        format.json { render json: @variante.errors, status: :unprocessable_entity }
      end
    end

  end
end
