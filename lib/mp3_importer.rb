require "pry"
class MP3Importer
  #taking information from one end and reformattting it to how you want it on your end
  attr_accessor :path, :library
  def initialize(path) #path represents folder
    @path = path
    #this is going to say what the file path is
  end

  
   #take that path, take all of those files and create an array
  def files
    songs = Dir.entries(path) #this is a separate class within itself 
    #this is saying delete each song in the array if it starts with a string of a period because they are all strings
    songs.reject {|song| song[0] == "."}
  end

  def import
   files.each {|song| Song.new_by_filename(song)}
  end
    
    
  

end