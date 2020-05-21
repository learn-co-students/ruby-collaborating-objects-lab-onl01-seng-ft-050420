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

    def add_song(song)
        song.artist = self 
    end

    def songs 
        Song.all.select {|song| song.artist == self }
    end

    def self.find_or_create_by_name(name)
        #it needs to return an artist
        #find the artist
        #create a new @artist if none exist(conditional)
        artist = @@all.find {|artist|  artist.name == name }
        if @@all.find {|artist|  artist.name == name }
            artist #return what we found
        else
            Artist.new(name)
        end
    end

    def print_songs
        songs.each {|song| puts song.name}
    end

end