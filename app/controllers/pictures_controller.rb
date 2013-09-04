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

  def edit
    # debugger
    @picture = Picture.find(params[:id])
  end

  def update
    
    @picture = Picture.find(params[:id])
    #debugger
    if @picture.update_attributes(params.require(:picture).permit(:title, :artist, :url))
      redirect_to "/pictures/#{@picture.id}"
    else
      render :edit
    end
  end
end
