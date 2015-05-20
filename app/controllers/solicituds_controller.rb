# -*- coding: utf-8 -*-
class SolicitudsController < ApplicationController
 
    before_filter :set_solicitud, only: [:show, :edit, :update, :destroy, :ver_solicitud_disenador, :aceptar, :rechazar, :terminar, :entregar, :motivo]
    before_filter :authorize
    

  # GET /solicituds
  # GET /solicituds.json
  def index
    unless authorize_page(session[:tipo_usuario],"Vendedor")
      flash[:error] = "Acceso no autorizado"
      redirect_to login_path
      false
    end
    @solicituds = Solicitud.where(vendedor_id: session[:usuario_id])
    
  end

  # GET /solicituds/1
  # GET /solicituds/1.json
  def show 
      @attachment = get_attachment(@solicitud.archivo_id)
  end
    
  def ver_solicitud_disenador
     if authorize_page(session[:tipo_usuario],"Diseñador Jefe")
    elsif
       authorize_page(session[:tipo_usuario],"Diseñador")
    else
      flash[:error] = "Acceso no autorizado"
      redirect_to login_path
      false
    end
  end
  
  def solicitudes_pendientes_jefe_disenador
    if authorize_page(session[:tipo_usuario],"Diseñador Jefe")
    elsif
      authorize_page(session[:tipo_usuario],"Diseñador")
    else
      flash[:error] = "Acceso no autorizado"
      redirect_to login_path
      false
    end
    @solicituds = Solicitud.where(estado: 0)  
  end
  # GET /solicituds/new
  def new
    @archivo = Attachment.new
    @solicitud = Solicitud.new
  end

  # GET /solicituds/1/edit
  def edit
    if authorize_page(session[:tipo_usuario],"Nadie")
    else
      flash[:error] = "Acceso no autorizado"
      redirect_to login_path
      false
    end
  end

  def solicitudes_disenador
    if authorize_page(session[:tipo_usuario],"Diseñador Jefe")
    elsif
      authorize_page(session[:tipo_usuario],"Diseñador")
    else
      flash[:error] = "Acceso no autorizado"
      redirect_to login_path
      false
    end
    @solicitudes = Solicitud.all
    end

  # POST /solicituds
  # POST /solicituds.json
  def create
    unless authorize_page(session[:tipo_usuario],"Vendedor")
      flash[:error] = "Acceso no autorizado"
      redirect_to login_path
      false
    end
    @solicitud = Solicitud.new(solicitud_params)
    @disenador = Usuario.where(tipo_usuario: "Diseñador Jefe").first
    @solicitud.disenador_id = @disenador.id;
    @solicitud.vendedor_id = session[:usuario_id]
    @solicitud.estado = 0
    @solicitud.fecha = Date.today
    if session[:archivo_id] != nil
      @solicitud.adjunto = true
      @solicitud.archivo_id = session[:archivo_id]
      session[:archivo_id] = nil
    end   
    #@archivo = Attachment.new(attachment_params)
    
    respond_to do |format|
      if @solicitud.save
        UserMailer.solicitud_creada(session[:correo], @solicitud).deliver_now
        UserMailer.solicitud_creada_disenador(@disenador.correo,@solicitud).deliver_now
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
    if authorize_page(session[:tipo_usuario],"Nadie")
    else
      flash[:error] = "Acceso no autorizado"
      redirect_to login_path
      false
    end
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
  
  def aceptar
    if authorize_page(session[:tipo_usuario],"Diseñador Jefe")
    elsif
      authorize_page(session[:tipo_usuario],"Diseñador")
    else
      flash[:error] = "Acceso no autorizado"
      redirect_to login_path
      false
    end
    unless  @solicitud.update(estado: 1)
      flash[:error] = "No se pudo actualizar el estado"
    else
      flash[:success] = "Solicitud aceptada"
      UserMailer.solicitud_aceptar(@solicitud).deliver_now
    end
    redirect_to solicitudes_pendientes_jefe_disenador_url
    
  end
  
  def motivo
    
  end

  def rechazar
    if authorize_page(session[:tipo_usuario],"Diseñador Jefe")
    elsif
      authorize_page(session[:tipo_usuario],"Diseñador")
    else
      flash[:error] = "Acceso no autorizado"
      redirect_to login_path
      false
    end
    unless  @solicitud.update(estado: 2)
      flash[:error] = "No se pudo actualizar el estado"
    else
      flash[:success] = "Solicitud rechazada"
        UserMailer.solicitud_rechazar(@solicitud,params[:comentario]).deliver_now
    end
    redirect_to solicitudes_pendientes_jefe_disenador_url
  end
  
  def terminar
    if authorize_page(session[:tipo_usuario],"Diseñador Jefe")
    elsif
      authorize_page(session[:tipo_usuario],"Diseñador")
    else
      flash[:error] = "Acceso no autorizado"
      redirect_to login_path
      false
    end
    unless  @solicitud.update(estado: 3)
      flash[:error] = "No se pudo actualizar el estado"
    else
      flash[:success] = "Solicitud actualizada a estado terminado"
      UserMailer.solicitud_terminar(@solicitud).deliver_now
    end
    redirect_to solicitudes_disenador_url
  end
  
  def entregar
    if authorize_page(session[:tipo_usuario],"Diseñador Jefe")
    elsif
      authorize_page(session[:tipo_usuario],"Diseñador")
    else
      flash[:error] = "Acceso no autorizado"
      redirect_to login_path
      false
    end
    unless  @solicitud.update(estado: 4)
      flash[:error] = "No se pudo actualizar el estado"
    else
      flash[:success] = "Solicitud actualizada a estado entregado"
      UserMailer.solicitud_entregar(@solicitud).deliver_now
    end
    redirect_to solicitudes_disenador_url
  end
  

  # DELETE /solicituds/1
  # DELETE /solicituds/1.json
  def destroy
     unless authorize_page(session[:tipo_usuario],"Administrador")
      flash[:error] = "Acceso no autorizado"
      redirect_to login_path
      false
    end
    @solicitud.destroy
    respond_to do |format|
      format.html { redirect_to solicitudes_administrador_url, notice: 'Solicitud borrada.' }
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
      params.require(:solicitud).permit(:fecha,:vendedor_id, :cliente, :disenador_id, :linea, :tipo, :set_tallas, :contramuestra, :referencia, :talla, :muestra_tela, :nombre_tela, :adjunto, :cantidad, :especificacion, :estado, :tipo_pantalon)
    end
  end
