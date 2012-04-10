class AlbumsController < ApplicationController
  before_filter :authenticate_user!
  # GET /albums
  # GET /albums.json
  def index
    @albums = Album.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @albums }
    end
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
    @album = Album.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @album }
    end
  end

  # GET /albums/new
  # GET /albums/new.json
  def new
    @album = Album.new
        
    @album.photos.build 

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @album }
    end
  end

  # GET /albums/1/edit
  def edit
    @album = Album.find(params[:id])
    @album.photos.build
  end

  # POST /albums
  # POST /albums.json
  def create
    @album = Album.new(params[:album])
    # @album.photos.build 
    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, notice: 'Album was successfully created.' }
        format.json { render json: @album, status: :created, location: @album }
      else
        @album.photos.build
        Rails.logger.info "----------------#{@album.errors.inspect}------------------"
        format.html { render action: "new" }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /albums/1
  # PUT /albums/1.json
  def update
    @album = Album.find(params[:id])

    respond_to do |format|
      if @album.update_attributes(params[:album])
        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album = Album.find(params[:id])
    @album.destroy

    respond_to do |format|
      format.html { redirect_to albums_url }
      format.json { head :no_content }
    end
  end
  
  def add_photo
    @album = Album.find(params[:id])
    # @photo = Photo.new(:image => params[:photo][:image])
    # @photo = @album.photos.build(:image => params[:photo][:image])
    # @photo.album_id = @album.id
    @photo = @album.photos.build(params[:photo])
    respond_to do |format|
      if @photo.save
        format.html { redirect_to @album, notice: 'Photos was successfully created.' }
      else
        Rails.logger.info "----------------#{@photo.errors.inspect}------------------"
      end
    end
  end
end
