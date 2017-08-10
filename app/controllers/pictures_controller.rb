class PicturesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update]

  def latest
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = current_user.pictures.build(picture_params)

    if @picture.save
      redirect_to latest_path, notice: 'Photo successfully uploaded.'
    else
      render :action => 'new'
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:description, :file)
  end
end
