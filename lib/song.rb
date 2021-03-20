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
        filename = filename.chomp(".mp3").split(" ")
        artist_names = []
        artist_names << filename[0]
        until filename.shift == "-"
            artist_names << filename[0] if filename[0] != "-"
        end
        song_name = []
        song_name << filename[0]
        until filename.shift == "-"
            song_name << filename[0] if filename[0] != "-"
        end
        genre = []
        genre << filename[0]
        self.new(song_name.join(" "))
        
        @artist = Artist.new(artist_names.join(" "))
        
        
    end
    def artist_name=(name)
        if self.artist.nil?
            self.artist = Artist.new(name)
        else
            self.artist.name = name
        end
    end

end

