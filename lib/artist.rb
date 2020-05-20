class Artist
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def add_song(song)
    # keeps track of an artist's songs
    song.artist = self
  end

  def songs
    # lists all songs that belong to this artist
    Song.all.select {|song| song.artist == self}
  end

  def self.find_or_create_by_name(artist_name)
    # always returns an Artist instance
    #finds or creates an artist by name maintaining uniqueness of objects by name property
    #Creates new instance of Artist if none exist
    if self.all.find {|artist| artist.name == artist_name}
      self.all.find {|artist| artist.name == artist_name}
    else
      self.new(artist_name)
    end
  end

  def print_songs
    # lists all of the artist's songs
    songs.each {|song| puts song.name}
  end
end
