class AttachmentsController < ApplicationController
    def new
      @attachment = Attachment.new
  end

  def create
    @attachment = Attachment.new(attachment_params)
    if @attachment.save
      redirect_to @attachment, alert: "Se guardo tu archivo"
    else
      redirect_to @attachment, notice: "No pudimos agregar tu archivo"
    end
  end
  private
   def attachment_params
      params.require(:attachment).permit(:archivo)
    end
end
