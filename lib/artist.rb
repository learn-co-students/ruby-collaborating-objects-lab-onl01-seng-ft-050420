class Artist

  attr_accessor :name
  @@all =[]

  def initialize(name)
    @name = name
    @@all << self
  end

  def add_song(song)
    song.artist = self
    
      
      
  end
  
  def songs
    Song.all.select do |song|
      if song.artist == self
        song
      end  
    end
    
  end

  def save
    @@all << self #saves the artist name to the all array
  end

  def self.all
    @@all #displays the all array
  end

  def self.find_or_create_by_name(artist_name)
    found_artist = self.all.find {|artist| artist.name == artist_name}
    if found_artist
      found_artist
    else
      new_artist = self.new(artist_name)
      new_artist.save
      new_artist
    end
  end

  def print_songs
    self.songs
 
  
  end
end