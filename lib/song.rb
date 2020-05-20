class Song 
  attr_accessor :name, :artist
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.new_by_filename(filename)
    filename = filename.split(" - ")
    song_name = filename[1]
    artist_names = filename[0]
    song_name = self.new(song_name)
    song_name.artist_name=(artist_names)
    song_name
  end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
  end
  
  def self.all
    @@all
  end
  
end