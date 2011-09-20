# Programming Praxis
# Exercise 198: Arithmetic Drill
# http://programmingpraxis.com/2010/12/31/arithmetic-drill/
#
# Author: Brent Chuang
# Date:   1/1/2011

def generate_question
  a = rand(11)
  b = rand(11)
  "#{a} + #{b}"
end

while true
  question = generate_question
  answer = eval question

  response = nil
  until response.to_i == answer || response == "?"
    puts "Wrong, try again!" unless response.nil?
    print "#{question} = "
    response = gets.chomp
  end
  
  puts (response == "?") ? answer : "Right!"

  puts "Goodbye!" if response == nil
end

