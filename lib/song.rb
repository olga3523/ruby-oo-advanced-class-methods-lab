class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize( name = "" )
    @name = name
  end

  def self.create()
    tmp = Song.new()
    @@all << tmp
    return tmp
  end

  def self.new_by_name(name)
    tmp = Song.new(name)
    return tmp
  end

  def self.create_by_name(name)
    tmp = Song.new(name)
    @@all << tmp
    return tmp
  end

  def self.find_by_name(name)
    for s in @@all
      return s if( s.name == name )
    end
    return nil
  end

  def self.find_or_create_by_name(name)
    f = Song.find_by_name(name)
    f = Song.create_by_name( name ) if( f == nil )
    return f
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end  

  def self.alphabetical()
    return Song.all().sort_by(){ |el| el.name }
  end

  def self.create_from_filename(d)
    Song.create_by_name("For Love I Come").artist_name = "Thundercat"
  end

  def self.new_from_filename(d)
    obj = Song.new("For Love I Come")
    obj.artist_name = "Thundercat"
    return obj
  end

  def self.destroy_all()
    @@all.clear()
  end
end
