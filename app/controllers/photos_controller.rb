class PhotosController < ApplicationController
  def create
    @album = Album.find(params[:album_id])
    aux = []
    params[:photo][:image].each do |f|
      aux << {:image => f}
      params[:photo] = aux
      params[:photo].each do |photo|
       @photo = @album.photos.build(photo)
      end
      @photo.save
    end

    respond_to do |format|
      format.html { redirect_to(album_path(@album), :notice => 'Photos ware successfully Added.') }
    end    
  end
  
  def show
    @album = Album.find(params[:album_id])
    @photos = @album.photos
    @photo = @album.photos.find(params[:id])
    
    respond_to do |format|
      format.html {}
      format.js {}
    end   
  end
  
  def destroy
    @album = Album.find(params[:album_id])
    @photo = @album.photos.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to(album_path(@album), :notice => 'Photo was successfully deleted.') }
      format.json { head :no_content }
    end    
  end
end
