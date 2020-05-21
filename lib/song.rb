require "pry"
class Song
  attr_accessor :name, :artist, :artist_name
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
  @@all
  end
  
  def artist_name=(name)
   
    
   self.artist = Artist.find_or_create_by_name(name)
      
    
  end

 
def self.new_by_filename(file) #Michael Jackson - Black or white - pop.mp3
  split_array = file.split(" - ")
  
  # split_array is ["Michael Jackson", "Black or White", "pop.mp3"]
   
  
  song_name = split_array[1]#lines 25 to 33 are to create a new song
  artist_name = split_array[0]
  
  new_song = self.new(song_name) 
 #calls line 15 to return an instance
 new_song.artist_name = split_array[0] #associating a song with an artist
 new_song
  end


 end