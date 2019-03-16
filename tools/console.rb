require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

science = Cult.new("Scientology", 1995, "Seattle", "Aliens, man.")
religion = Cult.new("Christianity", 0, "Rome", "In God We Trust.",30)
dave = Follower.new("Dave", 28, "What?")
carl = Follower.new("Carl", 28, "Huh?")
johan = Follower.new("Johan", 50, "My THEORIES!")
linda = Follower.new("Linda", 42, "I have seen the cosmos.")
esther = Follower.new("Esther", 10, "I may or may not have killed my parents...")
sue = Follower.new("Sue", 25, "I'm not a cop.")

dave.join_cult(science)
dave.join_cult(religion)
carl.join_cult(science)
johan.join_cult(religion)
science.recruit_follower(linda)
religion.recruit_follower(linda)
science.recruit_follower(esther)
science.recruit_follower(sue)
sue.join_cult(religion)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
