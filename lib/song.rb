require "pry"

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

    def self.new_by_filename(filename)
        song_title = filename.split(" - ")[1]
        song = self.new(song_title)
        song.artist_name=filename.split(" - ")[0]
        song   
      end

    def artist_name=(name) 
        artist_1 = Artist.find_or_create_by_name(name)
        artist_1.add_song(self)
        self.artist = artist_1
        return artist_1

    end 
end 



       