require 'will_paginate/array'

class DiscogsController < ApplicationController
  include Diskoggr
  caches_action :get_discogs_releases, :get_discogs_releases_paginated

  def set_user_agent
    DiscogsApi.user_agent = 'diskoggr.'
  end

  def get_discogs_releases_paginated(artist_name)
    if (@releases.nil? || @releases.empty?)
      @releases = get_discogs_releases(artist_name)
    end
      @releases.paginate :page => params[:page], :per_page => 10
  end

  def get_discogs_releases(artist_name)
    # Get an artist
    result_json = DiscogsApi.get_artist(artist_name)
    diskoggrs = Hashie::Mash.new result_json

    diskoggrs['releases']
  end

end