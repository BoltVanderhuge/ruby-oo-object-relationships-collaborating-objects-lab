class Artist

    attr_accessor :name

    @@all = []

    def self.all
        @@all
    end

    def initialize(artist_name)
        @name = artist_name
        @@all << self
    end

    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def self.find_or_create_by_name(name)
        found_artist = self.all.find {|artist| artist.name == name}
        if found_artist == nil
            self.new(name)
        else
            found_artist
        end
    end

    def print_songs
        self.songs.each {|song| puts song.name}
    end
















end