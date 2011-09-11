require 'will_paginate/array'

class DiscogsController < ApplicationController

  before_filter :set_user_agent

  #caches_action :get_discogs_releases, :get_discogs_releases_paginated

  def set_user_agent
    DiscogsApi.user_agent = 'diskoggr.'
  end

  def get_discogs_releases_paginated(artist_name)
    if (@releases.nil? || @releases.empty?)
      @releases = Artist.search(artist_name)
    end
    @releases.paginate :page => params[:page], :per_page => 10
  end

  def get_artist
    if Artist.exists?(params[:id])
      artist = Artist.find(params[:id])
    else
      artist = Artist.find_by_name(params[:id])
    end
    artist
  end

  def get_artist_name
    artist = get_artist
    if artist.nil?
      # id is artist name
      artist_name = params[:name]
    else
      artist_name = artist.name
    end
    artist_name
  end

end