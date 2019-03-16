#Has many bloodoaths
#Has many Cults THROUGH BloodOaths.

class Follower

  attr_accessor :name, :age, :life_motto

  @@all = []

  def initialize(name, age, life_motto)
    @name = name
    @age = age
    @life_motto = life_motto
    @@all << self
  end

  def cults
    BloodOath.all.select{|oath| oath.follower == self}.map(&:cult)
  end

  def join_cult(cult)
    if(age < cult.minimum_age)
      puts "The cult turns you away at the door.  Disappointing..."
    else
      BloodOath.new(cult, self, Time.now.strftime("%Y-%m-%d"))
    end
  end

  def my_cults_slogans
    self.cults.each{|cult|
      puts cult.slogan
    }
  end

  def fellow_cult_members
    self.cults.each_with_object([]) {|cult, acc|
      acc << cult.followers
    }.flatten.uniq
  end

  def self.followers_by_cults_joined
    @@all.sort{|follower1, follower2|
      follower1.cults.count <=> follower2.cults.count
    }
  end

  def self.most_active
    self.followers_by_cults_joined.first
  end

  def self.top_ten
    self.followers_by_cults_joined[0..9]
  end

  def self.of_a_certain_age(age)
    @@all.select{|follower| follower.age = age}
  end



  def self.all
    @@all
  end


end
