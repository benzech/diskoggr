class Artist < ActiveRecord::Base

  def self.search(search)
    if search
      get_discogs_releases("#{search}");
    end
  end

  def self.get_discogs_releases(artist_name)
    # Get an artist
    result_json = DiscogsApi.get_artist(artist_name)
    diskoggrs = Hashie::Mash.new result_json

    diskoggrs['releases']
  end
end
