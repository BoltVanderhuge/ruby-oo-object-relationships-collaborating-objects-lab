require 'pry'
class MP3Importer

    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        Dir.glob(self.path + "/*.mp3").map {|path| File.basename(path)}
    end

    def import
        self.files.each {|song| Song.new_by_filename(song)}
    end

end