class MP3Importer
  attr_accessor :path, :files
  
  def initialize(path)
    @path = path
    @files = []
    
    Dir.entries(path).each do |x|
      @files << File.basename(x) if File.extname(x) == ".mp3"
    end
  end
  
  def import
    @files.each do |x|
      Song.new_by_filename(x)
    end
  end
end