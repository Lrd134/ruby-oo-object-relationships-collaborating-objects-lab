require 'pry'
class MP3Importer
    attr_accessor :path, :files
    
    def initialize(filepath)
        @path = filepath
    end
    def files
        @files = Dir["./spec/fixtures/mp3s/*"]
        @files.each do | obj |
            obj.slice! "./spec/fixtures/mp3s/"
        end  
        @files
    end
    def import
        
        self.files.each do | obj |
            Song.new_by_filename(obj)
        end
    end
end