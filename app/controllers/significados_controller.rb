class SignificadosController < ApplicationController
  # GET /significados
  # GET /significados.json
  def index
    @significados = Significado.all
    if params[:q].present?
      @busqueda= Significado.where("palabra like :search", search: "%#{params[:q]}%", limit: params[:page_limit])
    else
      @busqueda = Significado.find(:all, limit: 10)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @busqueda}
    end
  end

  # GET /significados/1
  # GET /significados/1.json
  def show
    @significado = Significado.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @significado }
    end
  end

  # GET /significados/new
  # GET /significados/new.json
  def new
    @significado = Significado.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @significado }
    end
  end

  # GET /significados/1/edit
  def edit
    @significado = Significado.find(params[:id])
  end

  # POST /significados
  # POST /significados.json
  def create
    @significado = Significado.new(params[:significado])

    respond_to do |format|
      if @significado.save
        format.html { redirect_to @significado, notice: 'El significado fue guardado correctamente' }
        format.json { render json: @significado, status: :created, location: @significado }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @significado.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /significados/1
  # PUT /significados/1.json
  def update
    @significado = Significado.find(params[:id])

    respond_to do |format|
      if @significado.update_attributes(params[:significado])
        format.html { redirect_to @significado, notice: 'Significado was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @significado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /significados/1
  # DELETE /significados/1.json
  def destroy
    @significado = Significado.find(params[:id])
    @significado.destroy

    respond_to do |format|
      format.html { redirect_to significados_url }
      format.json { head :no_content }
    end
  end
end
