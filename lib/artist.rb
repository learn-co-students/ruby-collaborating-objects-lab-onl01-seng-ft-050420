class Artist 
  
  attr_accessor :name 
  
  @@all =[]
  
  def initialize(name) 
    @name = name
    @@all << self
    
  end
  
  def self.all 
    @@all
    
  end 
  
  def add_song(song)   
    song.artist = self 
  end
  
  
  
  def songs    
    
    Song.all.select do | song | 
      song.artist == self
    end
    
  end 
  
  
  
  def self.find_or_create_by_name(name_from_file)
    
    @@all.find do | song_inst |
      if song_inst.name != name_from_file 
        self.new(name_from_file)
      end
    end
    
    return self.new(name_from_file)
    
  end 
  
  
  def print_songs
    all_songs_artist = songs
    all_songs_artist.each do |song|
      puts song.name
    end
    
  end
 
  
end 


