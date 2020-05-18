class Artist 
  attr_accessor :name, :songs
  @@all = []
  def initialize(name)
    @name = name 
    @@all << self
    @songs = []
  end 
  def self.all 
    @@all 
  end 
  def add_song(song)
    song.artist = self
    @songs << song
  end 
  def self.find_or_create_by_name(name)
    find = @@all.find {|artist| artist.name == name}
    if find.nil?
      self.new(name)
    else 
      find
    end 
  end 
  def print_songs
    Song.all.any? {|songs| puts songs.name if songs.artist == self}
  end 
end 