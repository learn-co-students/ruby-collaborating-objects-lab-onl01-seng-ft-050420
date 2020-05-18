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
    parsed_file = filename.split(" - ")
    new_song = self.new(parsed_file[1])
    new_song.artist = Artist.new(parsed_file[0])
    new_song
  end 
  
  def artist_name=(artist_name)
    @artist = Artist.find_or_create_by_name(artist_name)
  end
  
  
end 


# "Drake - Hotline Bling"