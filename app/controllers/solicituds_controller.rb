class SolicitudsController < ApplicationController
  before_action :set_solicitud, only: [:show, :edit, :update, :destroy]

  # GET /solicituds
  # GET /solicituds.json
  def index
    @solicituds = Solicitud.all
    @vendedor = Usuario.first    
  end

  # GET /solicituds/1
  # GET /solicituds/1.json
  def show
    
    @vendedor = Usuario.first   
  end

  # GET /solicituds/new
  def new
    @solicitud = Solicitud.new
    @vendedor = Usuario.first
  end

  # GET /solicituds/1/edit
  def edit
  end

  # POST /solicituds
  # POST /solicituds.json
  def create
    @solicitud = Solicitud.new(solicitud_params)
    @vendedor = Usuario.first
    @solicitud.vendedor_id = @vendedor.id
    @solicitud.estado = 0
    @solicitud.fecha = Date.today
    respond_to do |format|
      if @solicitud.save
        format.html { redirect_to @solicitud, notice: 'Solicitud realizada exitosamente.' }
        format.json { render :show, status: :created, location: @solicitud }
      else
        format.html { render :new }
        format.json { render json: @solicitud.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /solicituds/1
  # PATCH/PUT /solicituds/1.json
  def update
    respond_to do |format|
      if @solicitud.update(solicitud_params)
        format.html { redirect_to @solicitud, notice: 'Solicitud modificada exitosamente.' }
        format.json { render :show, status: :ok, location: @solicitud }
      else
        format.html { render :edit }
        format.json { render json: @solicitud.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /solicituds/1
  # DELETE /solicituds/1.json
  def destroy
    @solicitud.destroy
    respond_to do |format|
      format.html { redirect_to solicituds_url, notice: 'Solicitud borrada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_solicitud
      @solicitud = Solicitud.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def solicitud_params
      params.require(:solicitud).permit(:fecha,:vendedor_id, :cliente, :disenador_id, :linea, :tipo, :set_tallas, :contramuestra, :referencia, :talla, :muestra_tela, :nombre_tela, :adjunto, :cantidad, :especificacion, :estado)
    end
end
