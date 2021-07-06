require 'pry'
class Artist
  attr_accessor :name, :songs
  @@all = []  #stores all instance var of the class
  def initialize(name)
    @name = name
    @@all << self
    @songs = []   #to receive the artist's song
  end

  # def save    #Artist class: save all instances created (delete excess!)
  #   @@all << self
  # end
  
  def self.all  #class method: all returns all class Artist instances 
    @@all
  end
  
  def add_song(song)   #keeps track of an artist's 
    self.songs << song
  end
  
  def songs
    @songs
  end

  def self.find_or_create_by_name(name)


      # self.all.detect { |artist| artist.name == name } || self.new(name)


      if self.all.find {|artist| artist.name == name}     #finds an artist, if exists
          self.all.find {|artist| artist.name == name}
      else
          artist = Artist.new(name)  #create a new artist
          # artist.save (not needed)
          # return artist    #return the name attribute (instance of the artist) not needed
      end
  end
  
    def print_songs
      @songs.each {|song| puts song.name}
    end
end