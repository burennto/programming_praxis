# Programming Praxis
# Exercise 5: Flavius Josephus
# http://programmingpraxis.com/2009/02/19/flavius-josephus/
#
# Author: Brent Chuang
# Date:   3/1/2011

def josephus(number_of_people, interval)
  circle = Array.new(number_of_people) { :alive }
  killed = Array.new
  
  index_to_kill = -1
  
  until killed.length == number_of_people
    # find next kill, skipping already dead
    interval.times do
      begin
        index_to_kill += 1
        index_to_kill -= number_of_people if index_to_kill >= number_of_people
      end until circle[index_to_kill] == :alive
    end
    
    killed << index_to_kill
    circle[index_to_kill] = :dead
  end
  
  # position of the survivor
  killed.last + 1
end
