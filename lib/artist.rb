require 'pry'
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
  
  def songs 
    Song.all.select {|song| song.artist == self}
  end

  def add_song(title)
    title.artist = self 
  end

  def self.find_or_create_by_name(name)
    if @@all.find {|artist| artist.name == name}
        return @@all.find {|artist| artist.name == name}
    else 
      new_artist = Artist.new(name)
    end 
  end
      # artist_1 = Artist.find_or_create_by_name("Michael Jackson")
      # artist_1 = Artist.find_or_create_by_name("Drake")
  def print_songs
    songs.each {|song| puts song.name}
  end
  




end