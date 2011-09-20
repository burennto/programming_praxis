def kmp(text, pattern)
  text.split('').each_index do |start|
    compute_skips(pattern)
  end
end

private
  # The skip array holds the number of characters to skip, if a mismatch happens
  def compute_skips(pattern)
    
  end
  
  


require 'test/unit'

class TestKMP < Test::Unit::TestCase
  def setup
    @text = "English Premiere League"
  end
  
  def test_kmp
    assert_equal(0, brute_force_search(@text, "English"))
    assert_equal(8, brute_force_search(@text, "Premiere"))
    assert_equal(17, brute_force_search(@text, "League"))
  end
end