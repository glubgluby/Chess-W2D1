# PHASE 2
class FailToConvert < StandardError; end
class NotAFruit < StandardError; end
class ILOVECOFEE < StandardError; end
class NotBesties < StandardError; end
class NeedArgs < StandardError; end

def convert_to_int(str)
  raise FailToConvert unless str.chars.all?{|ch| ('0'..'9').to_a.include?(ch)}
  return Integer(str)
  rescue FailToConvert
  nil
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else 
    raise NotAFruit 
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  begin
    maybe_fruit = gets.chomp
  if maybe_fruit == "coffee"
    raise ILOVECOFEE
  end 
    reaction(maybe_fruit) 
  rescue ILOVECOFEE
    puts "Try again I love coffee"
    retry
  end
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise NeedArgs if name.size <= 0 || fav_pastime.size <= 0
    @name = name
    raise NotBesties if yrs_known < 5
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelets
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


