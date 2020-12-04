class Song
    attr_accessor :name, :artist
    @@all = []

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

    def self.new_by_filename(filename)
        song = self.new(filename.split(" - ")[1])
        artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
        song.artist = artist
        song
    end
    
    def artist_name=(name)
       self.artist = Artist.find_or_create_by_name(name)
       artist.add_song(self)
    end
    

 end