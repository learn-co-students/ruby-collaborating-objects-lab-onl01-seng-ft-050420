class Song
  attr_accessor :name, :artist
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end 
  
  def self.all
    @@all
  end
  
  def self.new_by_filename(filename)
    # Action Bronson - Larry Csonka - indie.mp3
    parsed_filename_arr = filename.split(" - ")
    song_name = parsed_filename_arr[1]
    artist_name = parsed_filename_arr[0]
    song = Song.new(song_name)
    song.artist_name = artist_name
    song
  end 
  
  def artist_name=(name)
    artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end 
end