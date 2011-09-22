# Programming Praxis
# Exercise 264: First Non-Repeating Character
# http://programmingpraxis.com/2011/08/19/first-non-repeating-character/
#
# Author: Brent Chuang
# Date:   20/9/2011
#
# Write a function that takes an input string and returns the first character from the string that is not repeated later in the string.
# For instance, the two letters “d” and “f” in the input string “aabcbcdeef” are non-repeating, and the function should return “d” since “f” appears later in the string.
# The function should return some indication if there are no non-repeating characters in the string.

module Ex264
    
  def self.find_first_unique input
    chars = input.split('')
    until chars.empty?
      c = chars.shift
      if chars.include?(c)
        chars.delete(c)
      else
        return c
      end
    end
    return "There were no unique characters in the input string"
  end
    
end


require 'test/unit'

class TestEx264 < Test::Unit::TestCase
  
  def test_find_first_unique
    assert_equal "d",   Ex264.find_first_unique("aabcbcdeef")
  end
    
end
