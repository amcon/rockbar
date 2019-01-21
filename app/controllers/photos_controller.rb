class PhotosController < ApplicationController

  def index
  	@photos = Photo.all
  end

  def show
  	@photo = Photo.find(params[:id])
  end

  def new
  	@album = PhotoAlbum.find(params[:photo_album_id])
  	@photo = Photo.new
  end

  def create
  	@album = PhotoAlbum.find(params[:photo_album_id])
  	@photo = Photo.new(photo_params)
  	if @photo.save
  		flash[:notice] = "Photo: '#{@photo.title}' was successfully added"
  		redirect_to(photo_album_path(@photo.photo_album))
  	else
  		render('new')
  	end
  end

  def edit
  	@album = PhotoAlbum.find(params[:photo_album_id])
  	@photo = Photo.find(params[:id])
  end

  def update
  	@album = PhotoAlbum.find(params[:photo_album_id])
  	@photo = Photo.find(params[:id])
  	if @photo.update_attributes(photo_params)
  		flash[:notice] = "Photo: '#{@photo.title}' was successfully updated"
  		redirect_to(photo_album_path(@photo.photo_album))
  	else
  		render('edit')
  	end
  end

  def delete
  	@album = PhotoAlbum.find(params[:photo_album_id])
  	@photo = Photo.find(params[:id])
  end

  def destroy
  	@album = PhotoAlbum.find(params[:photo_album_id])
  	@photo = Photo.find(params[:id])
		@photo.destroy
		flash[:notice] = "Photo: '#{@photo.title}' was deleted successfully"
		redirect_to(photo_album_path(@photo.photo_album))
  end

  private

  def photo_params
  	params.require(:photo).permit(:title, :photo_album_id, :photo_image_id)
  end
  
end
