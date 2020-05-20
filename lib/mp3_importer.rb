class MP3Importer

  attr_accessor :path

  def initialize(path)
     #accepts a file path to parse mp3 files from
     @path = path
  end

  def files
    #loads all the mp3 files in the path directory
    #normalizes the filename to just the mp3 filename with no path
    Dir.glob("#{path}/*.mp3").collect do |file|
      file.gsub("#{path}/","")
    end

  end

  def import
    #imports the files into the library by creating songs from a filename
    files.each {|file| Song.new_by_filename(file)}
  end
end
