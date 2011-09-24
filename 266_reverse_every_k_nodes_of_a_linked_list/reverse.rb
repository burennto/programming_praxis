# Programming Praxis
# Exercise 266: Reverse Every K Nodes of a Linked List
# http://programmingpraxis.com/2011/08/26/reverse-every-k-nodes-of-a-linked-list/
#
# Author: Brent Chuang (burennto@gmail.com)
# Date: 24/9/2011
# 

module Ex266
  class << self
    
    def reverse list, block_size
      reversed = []
      list.each_slice(block_size) do |slice|
        reversed += slice.reverse
      end
      
      reversed
    end
     
  end  
end



require 'test/unit'

class TestEx66 < Test::Unit::TestCase
  
  def setup
    @list = [1, 2, 3, 4, 5, 6]
  end  
  
  def test_reverse
    assert_equal [2, 1, 4, 3, 6, 5], Ex266.reverse(@list, 2)
    assert_equal [3, 2, 1, 6, 5, 4], Ex266.reverse(@list, 3)
    assert_equal [4, 3, 2, 1, 6, 5], Ex266.reverse(@list, 4)
    assert_equal [5, 4, 3, 2, 1, 6], Ex266.reverse(@list, 5)
    assert_equal [6, 5, 4, 3, 2, 1], Ex266.reverse(@list, 6)
  end
  
end