require 'pry'
class MP3Importer 
  
  attr_accessor :path
  
  def initialize(directory_files)
    @path = directory_files
  end
  
  def files
    w = Dir.chdir(@path) do | path |
          Dir.glob("*.mp3")
        end
  end 
  
  
  
  def import
    files.each do |file| 
      Song.new_by_filename(file)
    end
    
  end 
    
end 