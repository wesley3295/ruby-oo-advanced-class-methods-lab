class Song
  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
      
  
  def self.create
  song = self.new
  self.all << song
  song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
    end

  def self.find_or_create_by_name(name)
  self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |s| s.name}
  end
 
  def self.new_from_filename(mp3)
    song = self.new
 artist_song = mp3.split(" - ")
 song.name = artist_song[1].gsub(".mp3", "")
 song.artist_name= artist_song[0]
song
  end

  def self.create_from_filename(mp3)
    song = self.create
 artist_song = mp3.split(" - ")
 song.name = artist_song[1].gsub(".mp3", "")
 song.artist_name= artist_song[0]
song
  end
def self.destroy_all
  self.all.clear
end
end


