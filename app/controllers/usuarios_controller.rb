class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show,:update ,:edit, :destroy]
  before_filter :authorize
  # GET /usuarios
  # GET /usuarios.json
  
  def solicitudes_administrador
    unless authorize_page(session[:tipo_usuario],"Administrador")
      flash[:error] = "Acceso no autorizado"
      redirect_to login_path
      false
    end
    @solicitudes = Solicitud.all
  end
  def index
    unless authorize_page(session[:tipo_usuario],"Administrador")
      flash[:error] = "Acceso no autorizado"
      redirect_to login_path
      false
    end

    @usuarios = Usuario.all
  end
  def index_disenador
      unless authorize_page(session[:tipo_usuario],"Diseñador Jefe")
      flash[:error] = "Acceso no autorizado"
      redirect_to login_path
      false
    end
    @usuarios = Usuario.all
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
    unless authorize_page(session[:tipo_usuario],"Administrador")
      flash[:error] = "Acceso no autorizado"
      redirect_to login_path
      false
    end  
    @usuario = Usuario.find(params[:id]) 
  end

  # GET /usuarios/new
  def new
    unless authorize_page(session[:tipo_usuario],"Administrador")
      flash[:error] = "Acceso no autorizado"
      redirect_to login_path
      false
    end    
    @usuario = Usuario.new
  end

  # GET /usuarios/1/edit
  def edit
    @usuario = Usuario.find(params[:id])
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    unless authorize_page(session[:tipo_usuario],"Administrador")
      flash[:error] = "Acceso no autorizado"
      redirect_to login_path
      false
    end  
    @usuario = Usuario.new(usuario_params)
    respond_to do |format|
      if @usuario.save
        format.html { redirect_to @usuario, notice: 'Usuario creado exitosamente' }
        format.json { render :show, status: :created, location: @usuario }
      else
        format.html { render :new }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    unless authorize_page(session[:tipo_usuario],"Administrador")
      flash[:error] = "Acceso no autorizado"
      redirect_to login_path
      false
    end  
    @usuario = get_usuario(params[:id])
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to @usuario, notice: 'Usuario actualizado exitosamente' }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    unless authorize_page(session[:tipo_usuario],"Administrador")
      flash[:error] = "Acceso no autorizado"
      redirect_to login_path
      false
    end  
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'Usuario eliminado exitosamente' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
     @usuario = Usuario.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:usuario).permit(:nombre, :apellido, :cedula, :clave, :correo, :tipo_usuario)
    end
end
