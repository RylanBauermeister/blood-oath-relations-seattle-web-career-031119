#Belongs to one Follower and one Cult.
require "time"
class BloodOath

  attr_accessor :cult, :follower, :initiation_date

  @@all = []

  def initialize(cult, follower, initiation_date)
    @cult = cult
    @follower = follower
    @initiation_date = initiation_date
    @@all << self
  end

  def self.first_oath
    @@all.min {|oath1, oath2|
      Time.parse(oath1.initiation_date) <=> Time.parse(oath2.initiation_date)
    }
  end

  def self.all
    @@all
  end

end
