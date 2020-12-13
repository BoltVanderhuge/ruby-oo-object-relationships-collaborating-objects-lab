class Song

    attr_accessor :name, :artist

    @@all = []

    def self.all
        @@all
    end

    def initialize(song_name)
        @name = song_name 
        @@all << self
    end

    def self.new_by_filename(filename)
        artist_song_genre = filename.split(" - ")
        new_song = self.new(artist_song_genre[1])
        new_song.artist = Artist.find_or_create_by_name(artist_song_genre[0])
        new_song
    end

    def artist_name=(name)
        artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
        
    end


end