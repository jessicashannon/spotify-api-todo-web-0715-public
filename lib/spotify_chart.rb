require 'json'
require 'open-uri'

class SpotifyChart

  BASE_URL = "http://charts.spotify.com/api/tracks/most_streamed"

  def get_url(region)
    "#{BASE_URL}/#{region}/weekly/latest"
  end

  def get_json(url)
    JSON.parse(open(url).read)
  end


  def get_first_track_info(music_hash)
    # example music_hash:
    # {  
    #   "tracks" => [  
    #     {  
    #       "date"         =>"2014-09-14",
    #       "track_name"   =>"All About That Bass",
    #       "artist_name"  =>"Meghan Trainor",
    #       "album_name"   =>"Title"
    #     },
    #     {  
    #       "date"         =>"2014-09-14",
    #       "track_name"   =>"Break Free",
    #       "artist_name"  =>"Ariana Grande",
    #       "album_name"   =>"Break Free"
    #     }
    #   ]
    # }
    track_name = music_hash["tracks"][0]["track_name"]
    artist_name = music_hash["tracks"][0]["artist_name"]
    album_name = music_hash["tracks"][0]["album_name"]

    "#{track_name} by #{artist_name} from the album #{album_name}"

    # given a hash, like the one above, this method should return a string like:
    # <track name> by <artist name> from the <album name>
  
    # the track name, artist name, and album name should be the first track in the
    # tracks array
  end


  def most_streamed(region)
    # call on #get_url here, where preference is the string 'most_streamed',
    # and set it equal to a variable

    get_first_track_info(get_json(get_url('us')))

  end

end
