class PalabrasController < ApplicationController
  # GET /palabras
  # GET /palabras.json
  def index
    @palabras = Palabra.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @palabras }
    end
  end

  # GET /palabras/1
  # GET /palabras/1.json
  def show
    @palabra = Palabra.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @palabra }
    end
  end

  # GET /palabras/new
  # GET /palabras/new.json
  def new
    @palabra = Palabra.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @palabra }
    end
  end

  # GET /palabras/1/edit
  def edit
    @palabra = Palabra.find(params[:id])
  end

  # POST /palabras
  # POST /palabras.json
  def create
    @palabra = Palabra.new(params[:palabra])

    respond_to do |format|
      if @palabra.save
        format.html { redirect_to @palabra, notice: 'Palabra was successfully created.' }
        format.json { render json: @palabra, status: :created, location: @palabra }
      else
        format.html { render action: "new" }
        format.json { render json: @palabra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /palabras/1
  # PUT /palabras/1.json
  def update
    @palabra = Palabra.find(params[:id])

    respond_to do |format|
      if @palabra.update_attributes(params[:palabra])
        format.html { redirect_to @palabra, notice: 'Palabra was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @palabra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /palabras/1
  # DELETE /palabras/1.json
  def destroy
    @palabra = Palabra.find(params[:id])
    @palabra.destroy

    respond_to do |format|
      format.html { redirect_to palabras_url }
      format.json { head :no_content }
    end
  end
end
