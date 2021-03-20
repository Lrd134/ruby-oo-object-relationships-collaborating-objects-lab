require 'pry'
class Song
    attr_accessor :name, :artist, :genre
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end
    def self.all
        @@all
    end
    def self.new_by_filename(filename) # Michael Jackson - Black or White - pop.mp3
        
        filename = filename.chomp(".mp3").split(" - ")
        # binding.pry
        new_song = self.new(filename[1])
        new_song.artist_name = filename[0]
        new_song.genre = filename[2]
        new_song
    end
    def artist_name=(name)
        if self.artist.nil?
            self.artist = Artist.find_or_create_by_name(name)
        end
    end

end

