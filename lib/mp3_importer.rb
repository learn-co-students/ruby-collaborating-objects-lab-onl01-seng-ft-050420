class MP3Importer
  attr_accessor :path, :files
  
  def initialize(path)
    @path = path
    @files = []
    Dir.entries(path).each do |mp3| 
      if File.extname(mp3) == ".mp3"
        @files << mp3 # `Dir` and `File` methods are sweet!
      end
    end
  end

  def import
    @files.each { |file| Song.new_by_filename(file) }
  end
end