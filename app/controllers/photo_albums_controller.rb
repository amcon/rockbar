class PhotoAlbumsController < ApplicationController

  before_action :confirm_logged_in, except: [:index, :show]

  respond_to :html

  def index
  	@albums = PhotoAlbum.newest_first
  end

  def show
  	@album = PhotoAlbum.find(params[:id])
  end

  def new
		@album = PhotoAlbum.new
	end

	def create
		@album = PhotoAlbum.new(album_params)
		if @album.save
			flash[:notice] = "#{@album.title} was created successfully!"
			redirect_to(photo_album_path(@album))
		else
			render('new')
		end
	end

	def edit
		@album = PhotoAlbum.find(params[:id])
	end

	def update
		@album = PhotoAlbum.find(params[:id])
		if @album.update_attributes(album_params)
			flash[:notice] = "#{@album.title} was updated successfully!"
			redirect_to(photo_album_path(@album))
		else
			render('edit')
		end
	end

	def delete
		@album = PhotoAlbum.find(params[:id])
	end

	def destroy
		@album = PhotoAlbum.find(params[:id])
		@album.destroy
		flash[:notice] = "#{@album.title} was deleted successfully!"
		redirect_to(photo_albums_path)
  end

  private

  def album_params
  	params.require(:photo_album).permit(:title, :album_image_id, :description)
  end
  
end
