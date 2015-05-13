class AttachmentsController < ApplicationController
    def new
      @attachment = Attachment.new
  end

  def create
    @attachment = Attachment.new(attachment_params)
      
      if @attachment.save
          direccion = "http://storage.googleapis.com/imagenessolicitudes/attachments/archivos/000/000/00"+ @attachment.id.to_s + "/original/" + @attachment.archivo_file_name
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
end
