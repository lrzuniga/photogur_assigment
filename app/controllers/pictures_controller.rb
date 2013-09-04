class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(params.require(:picture).permit(:title, :artist, :url))
    if @picture.save
      redirect_to pictures_url
    else
     render :new
   end
  end

  

end
