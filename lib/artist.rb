require "pry"
class Artist
  attr_accessor :name
  @@all = []
  
  def initialize(name)
    @name = name
    save
  end
  
  def self.all
    @@all
  end
  
  def add_song(song)
  song.artist = self
end
  

  def save
    @@all << self
  end
  
#def self.find_or_create_by_name(name)
#self.all.find do |artist|
 # self == @@all
  
 # self.all
#end
#end

  def songs
    
  Song.all.select do |song|
    
    self == song.artist #micheal jackson = an instance of an artist
    #self is one instance of an artist
  end
  end

  def self.find_or_create_by_name(artist_name)
    @@all.each {|artist| return artist if artist.name == artist_name}
    self.new(artist_name)
    #@@all.each do |artist|
      #if artist.name == artist_name
       # return artist
      #self.new(artist_name)
     # end
   # end
   
  end

  def print_songs
    songs.each {|song| puts song.name}
    
  end
  
end

