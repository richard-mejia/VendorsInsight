class AttachmentsController < ApplicationController
  before_filter :authorize

  def new
    @attachment = Attachment.new
  end

  def create
    if authorize_page(session[:tipo_usuario],"Vendedor")
    else
      flash[:error] = "Acceso no autorizado"
      redirect_to login_path
      false
    end
    @attachment = Attachment.new(attachment_params)
    
    if @attachment.save
      number = @attachment.id
      direccion = "http://storage.googleapis.com/imagenessolicitudes/attachments/archivos/000/000/"+ nro_ceros(number) + "/original/" + @attachment.archivo_file_name
      @attachment.url = direccion
      @attachment.save
      session[:archivo_id] = @attachment.id
      redirect_to new_solicitud_url 
    else
      redirect_to @attachment, notice: "No pudimos agregar tu archivo"
    end
  end
  private
  def attachment_params
    params.require(:attachment).permit(:archivo)
  end
  
  def nro_ceros(number)
    if number < 10
      return "00" + number.to_s
      
    elsif number < 100
      return "0" + number.to_s
    else
      return number.to_s
    end 
  end
end
