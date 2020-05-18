class Artist
  attr_accessor :name, :songs
  
  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end
  
  def self.all
    return @@all
  end
  
  def add_song(song)
    @songs << song
  end
  
  def self.find_or_create_by_name(name)
    artist = @@all.find {|x| x.name == name}
    artist = self.new(name) if artist == NIL
    
    return artist
  end
  
  def print_songs
    @songs.each do |x|
      puts x.name
    end
  end
end