# Programming Praxis
# Exercise 268: Two String Exercises
# http://http://programmingpraxis.com/2011/09/02/two-string-exercises/
#
# Author: Brent Chuang
# Date:   20/9/2011
#
# These two problems seem to be on every list of programming interview questions: 
# 1) Remove all duplicate characters from a string. Thus, “aaabbb” becomes “ab” and “abcbd” becomes “abcd”.
# 2) Replace all runs of consecutive spaces with a single space. Thus, “a.b” is unchanged and “a..b” becomes “a.b”, using a dot to make the space visible.
# Your task is to write the two requested functions. When you are finished, you are welcome to read or run a suggested solution, or to post your own solution or discuss the exercise in the comments below.

module Ex268
    
  def self.remove_duplicates input
    input.split('').uniq.join()
  end
  
  def self.replace_spaces input
    input.tr_s(' ', ' ')
  end
  
end


require 'test/unit'

class TestEx268 < Test::Unit::TestCase
  
  def test_remove_duplicates
    assert_equal "ab",   Ex268.remove_duplicates("aaabbb")
    assert_equal "abcd", Ex268.remove_duplicates("abcbd")
    assert_equal "abcd", Ex268.remove_duplicates("aabacada")
  end
  
  def test_replace_spaces
    assert_equal "a b",    Ex268.replace_spaces("a b")
    assert_equal "a b",    Ex268.replace_spaces("a  b")
    assert_equal "a b c",  Ex268.replace_spaces("a  b  c")
    assert_equal "a b c ", Ex268.replace_spaces("a  b  c  ")
  end
  
end