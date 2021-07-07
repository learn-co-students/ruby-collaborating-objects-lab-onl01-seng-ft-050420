class MP3Importer 
  attr_accessor :path
  def initialize(path)
    @path =path
  end
  
  def files
    b=[]
    dir=Dir.new(self.path)
    dir.entries.each do |x|
      if x.include?("mp3")
        b << x 
      end
    end
     b
  end
  
  def import
    self.files.each do |x|
      Song.new_by_filename(x)
    end
  end
  
end


