class Artist
    attr_accessor :name
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end
    def songs
        Song.all.select {|obj | obj.artist == self }
    end
    def add_song(song)
        song.artist = self
    end
    
    def self.all
        @@all
    end
    def self.find_or_create_by_name(name)
        found_index = nil
        new_artist = nil
            @@all.each_with_index do | obj, index |
                if obj.name == name
                    found_index = index 
                end
            end
        found_index.nil? ? self.new(name) : @@all[found_index]
    end
    def print_songs
        Song.all.each do | element |
            puts element.name if element.artist == self
        end
    end
end
