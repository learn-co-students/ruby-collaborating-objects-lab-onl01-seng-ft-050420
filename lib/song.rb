require 'pry'
class Song
    attr_accessor :name, :artist
    @@all = []
    def initialize(name)
        @name = name
        @@all << self 
    end

    def self.all
        @@all 
    end

    def self.new_by_filename(file_name)
        array = file_name.split(" - ")
        artist = array[0]
        name = array[1]
        song = Song.new(name) 
        song.artist_name = artist 
        song 
        #"Michael Jackson - Black or White - pop.mp3"
        #creates a new instance
        #associates new song instnace to the artist from the filename 
    end

    def artist_name=(name)
        @artist = Artist.find_or_create_by_name(name)
    end

end