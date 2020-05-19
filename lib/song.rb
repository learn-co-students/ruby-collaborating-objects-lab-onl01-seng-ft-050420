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
  def artist_name=(name)
   artist = Artist.find_or_create_by_name(name)
   self.artist = artist
  end
  def self.new_by_filename(filename)
    song = filename.split(" - ")
    artist = Artist.find_or_create_by_name(song[0])
    name = song[1]
    genre = song[2].split(".")[0]
    new_song = Song.new(name)
    new_song.artist = artist
    @@all << new_song
    return new_song
  end
end