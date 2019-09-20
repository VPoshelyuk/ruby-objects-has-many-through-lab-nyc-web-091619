class Genre
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select{|song| song.genre == self}
    end

    def artists
        artists_list = Song.all.select{|song| song.genre == self}
        artists_list.map do |song|
            song.artist
        end
    end

end