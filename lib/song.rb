class Song
  @@all = []

  attr_accessor :name, :artist_name

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create()
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song.save
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      return self.find_by_name(name)
    end
  end

  def self.alphabetical()
    self.all.sort_by{|order| order.name} #you must specify the instance of the enumberator as a name so that you can run the method ON the instances together
  end

  def self.new_from_filename(music)
    array = music.split(" - ")
      person = array[0]
      name_array = array[1].split(".mp3")
        name = name_array[0]
      new_song = self.create_by_name(name)
      new_song.artist_name = person
      new_song
    end

  def self.create_from_filename(music)
    array = music.split(" - ")
        person = array[0]
        name_array = array[1].split(".mp3")
          name = name_array[0]
        new_song = self.create_by_name(name)
        new_song.artist_name = person
        new_song
  end

  def self.destroy_all()
    self.all.clear
  end

end
