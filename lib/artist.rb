class Artist
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def songs
    Song.all.select { |song| song.artist == self }
  end

  def print_songs
    @songs.each { |song| puts song.name }
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    if self.all.find { |artist| artist.name == name }
      self.all.find { |artist| artist.name == name }
    else
      artist = Artist.new(name)
    end
  end
end