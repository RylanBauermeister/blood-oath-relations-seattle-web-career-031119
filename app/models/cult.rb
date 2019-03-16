#Has many BloodOaths.
#Has many Follower THROUGH BloodOaths.
require "pry"
class Cult

  attr_accessor :name, :founding_year, :location, :slogan, :minimum_age

  @@all = []

  def initialize(name, founding_year, location, slogan, minimum_age = 0)
    @name = name
    @founding_year = founding_year
    @location = location
    @slogan = slogan
    @minimum_age = minimum_age
    @@all << self
  end

  def recruit_follower(follower)
    if(follower.age < minimum_age)
      puts "Sorry, #{follower.name}.  You need to be at least #{minimum_age} to join."
    else
      BloodOath.new(self, follower, Time.now.strftime("%Y-%m-%d"))
    end
  end

  def followers
    BloodOath.all.select{|oath| oath.cult == self}.map(&:follower)
  end

  def cult_population
    BloodOath.all.count{|oath| oath.cult == self}
  end

  def follower_mottos
    followers.each{|follower|
      puts follower.life_motto
    }
  end

  def average_age
    followers.reduce(0){|sum, follower| sum += follower.age}/cult_population
  end

  def self.most_common_location
    self.locations.sort{|location1, location2|
      self.find_by_location(location1).count <=> self.find_by_location(location2).count
    }.first
  end

  def self.least_popular
    @@all.min {|a, b| a.cult_population <=> b.cult_population}
  end

  def self.locations
    @@all.map{|cult| cult.location}
  end

  def self.find_by_name(cult_name)
    @@all.find{|cult| cult.name == cult_name}
  end

  def self.find_by_location(cult_location)
    @@all.select{|cult| cult.location == cult_location}
  end

  def self.find_by_founding_year(cult_founding_year)
    @@all.select{|cult| cult.founding_year == cult_founding_year}
  end


  def self.all
    @@all
  end

end
