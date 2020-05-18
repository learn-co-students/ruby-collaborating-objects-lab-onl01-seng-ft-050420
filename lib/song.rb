class Song
  attr_accessor :name, :artist
  
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by_name(name)
    @artist = artist
  end
  
  def self.all
    @@all
  end

  def self.new_by_filename(filename)
    song = Song.new(filename.split(" - ")[1])
    artist = Artist.new(filename.split(" - ")[0])
    song.artist = artist
    artist.songs << song
    song
  end
end