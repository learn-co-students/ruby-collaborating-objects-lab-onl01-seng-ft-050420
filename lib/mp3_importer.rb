class MP3Importer
  attr_accessor :path, :files
  def initialize(file_path)
    @path = file_path
  end 
  def files
    @files = Dir.entries(path).select {|file| file.split(".").include?("mp3")}
  end 
  def import
    self.files.each {|file| Song.new_by_filename(file)}
  end   
end 