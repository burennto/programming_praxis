# Programming Praxis
# Exercise 255: Sum of Two Integers
# http://programmingpraxis.com/2011/07/19/sum-of-two-integers/
#
# Author: Brent Chuang (burennto@gmail.com)
# Date: 24/9/2011
# 

module Ex255    
  class << self
    
    def sum_checker list, target
      combinations = list.combination(2)
      pairs = combinations.reduce([]) do |memo, pair|
        memo << pair if pair.reduce(:+) == target
        memo
      end
      
      pairs.empty? ? nil : pairs
    end
    
  end  
end



require 'test/unit'

class TestEx255 < Test::Unit::TestCase
  
  def setup
    @list   = [1, 2, 3, 4, 5]    
  end  
  
  def test_sum_checker    
    assert_equal nil,              Ex255.sum_checker(@list, 1)
    assert_equal nil,              Ex255.sum_checker(@list, 2)
    assert_equal [[1, 2]],         Ex255.sum_checker(@list, 3)
    assert_equal [[1, 3]],         Ex255.sum_checker(@list, 4)
    assert_equal [[1, 4], [2, 3]], Ex255.sum_checker(@list, 5)
    assert_equal [[1, 5], [2, 4]], Ex255.sum_checker(@list, 6)
    assert_equal [[2, 5], [3, 4]], Ex255.sum_checker(@list, 7)
    assert_equal [[3, 5]],         Ex255.sum_checker(@list, 8)
    assert_equal [[4, 5]],         Ex255.sum_checker(@list, 9)
    assert_equal nil,              Ex255.sum_checker(@list, 10)
  end
  
end