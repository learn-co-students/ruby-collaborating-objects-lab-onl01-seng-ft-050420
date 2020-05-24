class Artist
  require "pry"
attr_accessor :name
@@all = []
def initialize(name)
@name = name
save
end

def save
    @@all << self
end

def self.all
    @@all
end
def songs
    Song.all.select {|song| song.artist == self}
    end
def add_song(song)
        song.artist = self
        
end
def self.find(name)
  @@all.find do |artist|
artist.name == name
  end
end

def self.find_or_create_by_name(name)
    if self.find(name)
      self.find(name)
    else
      self.new(name)
    end
end

 def print_songs()
   Song.all.select do |song| 
    if song.artist == self
   puts song.name
    end
  end

end
end