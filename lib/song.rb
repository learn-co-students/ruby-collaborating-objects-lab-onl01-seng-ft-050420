class Song 
  @@all = []
  attr_accessor :name, :artist 
  def initialize(name)
    @name = name 
    @@all << self 
  end 
  def self.all 
    @@all 
  end 
  
  def self.new_by_filename(mp3)
    array = mp3.split(" - ")
    song = Song.new(array[1])
    Artist.find_or_create_by_name(array[0]).add_song(song)
    song
  end 
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
  end 
end 