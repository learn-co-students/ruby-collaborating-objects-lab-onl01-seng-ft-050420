class Song
  attr_accessor :name, :artist, :artist_name
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    return @@all
  end
  
  def self.new_by_filename(file_name)
    file_name_split = file_name.split(" - ")
    
    song = Song.new(file_name_split[1])
    artist = Artist.new(file_name_split[0])
    
    song.artist = artist
    artist.songs << song
    
    return song
  end
  
  def artist_name=(name)
    artist = Artist.find_or_create_by_name(name)
    
    @artist = artist
  end
end