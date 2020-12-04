require 'pry'
class Artist 
    attr_accessor :name

    def initialize(name)
        @name = name
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        # if artist = self.all.find { |artist| name == artist.name } 
        #     artist
        # else
        #     self.new(name)
        # end
        self.all.find { |artist| name == artist.name } || Artist.new(name)
    end

    def print_songs
        songs.each {|song| puts song.name} 
    end
end