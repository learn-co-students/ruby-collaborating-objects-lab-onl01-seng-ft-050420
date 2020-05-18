require 'pry'

class MP3Importer 
  attr_accessor :path
  
  
  def initialize(path)
    @path = path
  end
  
  def files
    songs = Dir.entries(path).reject {|e| e[0] == "."}
  end

  def import 
    files.each do |file|
      Song.new_by_filename(file)
    end
  end 
  
end