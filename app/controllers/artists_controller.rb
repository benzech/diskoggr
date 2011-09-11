class ArtistsController < DiscogsController

  # GET /artists
  # GET /artists.json
  def index
    @artists = Artist.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @artists }
    end
  end

  # GET /artists/1
  # GET /artists/1.xml
  def show
    @discogs_releases = {}
    @artist_name = get_artist_name
    @discogs_releases = get_discogs_releases_paginated(@artist_name) unless @artist_name.blank?

    respond_to do |format|
      format.html # show.html.erb
      #format.xml { render :xml => @artist }
      format.js
    end
  end

  # GET /artists/new
  # GET /artists/new.json
  def new
    @artist = Artist.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @artist }
      format.js
    end
  end

  # GET /artists/1/edit
  def edit
    @artist = Artist.find(params[:id])
  end

  # POST /artists
  # POST /artists.json
  def create
    @artist = Artist.new(params[:artist])

    respond_to do |format|
      if @artist.save
        format.html { redirect_to @artist, notice: 'Artist was successfully created.' }
        format.json { render json: @artist, status: :created, location: @artist }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /artists/1
  # PUT /artists/1.json
  def update
    @artist = Artist.find(params[:id])

    respond_to do |format|
      if @artist.update_attributes(params[:artist])
        format.html { redirect_to @artist, notice: 'Artist was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artists/1
  # DELETE /artists/1.json
  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy

    respond_to do |format|
      format.html { redirect_to artists_url }
      format.json { head :ok }
      #format.js { render :nothing => true }
    end
  end

  # GET /artists/name
  # GET /artists/name.xml
  def list
    @artist_name = get_artist_name
    @discogs_releases = get_discogs_releases_paginated(@artist_name) unless @artist_name.blank?

    respond_to do |format|
      format.html # show.html.erb
      #format.xml { render :xml => @artist }
      format.js
    end
  end
end
