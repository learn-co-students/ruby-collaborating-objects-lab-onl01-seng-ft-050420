class Song 
  attr_accessor :name, :artist 
  @@all =[]
  def initialize(name=nil)
    @name =name
    @@all << self
  end
  
  def self.all 
    @@all
  end
  
  def self.new_by_filename(filename)
    song =self.new
    artist=Artist.new
    song.artist =artist
    song.name =filename.split(" - ")[1]
    song.artist.name=filename.split(" - ")[0]
    song
    # s_song = filename.split(" - ")[1]
    # s_artist = filename.split(" - ")[0]
    # song = self.new(s_song)
    # song.artist_name = s_artist
    # song
  end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    # self.artist.add_song(self)
  end
  
end

