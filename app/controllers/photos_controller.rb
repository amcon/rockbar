class PhotosController < ApplicationController

  before_action :confirm_logged_in, except: [:index, :show]
  before_action :find_album, except: [:index]

  def index
  	@photos = Photo.all
  end

  def show
  	@photo = Photo.find(params[:id])
  end

  def new
  	@photo = Photo.new
  end

  def create
  	@photo = Photo.new(photo_params)
  	if @photo.save
  		flash[:notice] = "Photo: '#{@photo.title}' was successfully added"
  		redirect_to(photo_album_path(@photo.photo_album))
  	else
  		render('new')
  	end
  end

  def edit
  	@photo = Photo.find(params[:id])
  end

  def update
  	@photo = Photo.find(params[:id])
  	if @photo.update_attributes(photo_params)
  		flash[:notice] = "Photo: '#{@photo.title}' was successfully updated"
  		redirect_to(photo_album_path(@photo.photo_album))
  	else
  		render('edit')
  	end
  end

  def delete
  	@photo = Photo.find(params[:id])
  end

  def destroy
  	@photo = Photo.find(params[:id])
		@photo.destroy
		flash[:notice] = "Photo: '#{@photo.title}' was deleted successfully"
		redirect_to(photo_album_path(@photo.photo_album))
  end

  private

  def find_album
  	@album = PhotoAlbum.find(params[:photo_album_id])
  end

  def photo_params
  	params.require(:photo).permit(:title, :photo_album_id, :photo_image_id)
  end
  
end
