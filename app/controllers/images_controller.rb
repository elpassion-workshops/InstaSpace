class ImagesController < ApplicationController
  
  def show
    
  end

  def new
    @image = Image.new(image_params)
  end

  private

  def image_params
    params.permit(:description, :image)
  end
end
