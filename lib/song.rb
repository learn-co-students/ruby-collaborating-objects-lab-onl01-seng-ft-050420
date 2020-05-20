require "pry"

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

  def self.new_by_filename(file)
    #binding.pry
    file_array = file.split(" - ")
    song = Song.new(file_array[1])
    song.artist_name = file_array[0]
    song
    # creates a new instance of a song from the file that's passed
    #associates new song instance with the artist from the filename

  end

  def artist_name=(name)
    #accepts an artist's name, finds or creates an Artist instance and assigns it to the Song's artist attribute
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end

end
