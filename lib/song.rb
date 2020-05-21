require 'pry'
class Song  
  
  attr_accessor :name, :artist 
  
  @@all = []
  
  def initialize(song_name)
    @name = song_name
    @@all << self 
  end
  
  def self.all 
    @@all
   end 
  
  def self.new_by_filename(filename)
    data = filename.split(" - ")
    
    song = self.new(data[1])
    
    song.artist_name = data[0]
    
    song
    
  end
  
 

  def artist_name=(artist_name)
    art_inst = Artist.find_or_create_by_name(artist_name)
    art_inst.add_song(self)
    
  end 
  
  
  
  
end 