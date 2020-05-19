require "pry"

class Song
  attr_accessor :artist, :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_by_filename(file_name)
    title = file_name.split(" - ")[1]
    artist = file_name.split(" - ")[0]
    new_song = self.new(title)
    new_song.artist_name = artist
    new_song
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by_name(name)
    self.artist = artist
    artist.add_song(self)
  end
end
