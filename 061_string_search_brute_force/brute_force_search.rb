def brute_force_search(text, pattern)
  text.split('').each_index do |start|
    # traverse pattern, stop on mismatch
    offset = 0
    while text.slice(start+offset, 1) == pattern.slice(offset, 1)
      offset += 1
      return start if offset == pattern.length
    end
  end
  nil
end

require 'test/unit'

class TestBruteForceSearch < Test::Unit::TestCase
  def setup
    @text = "English Premiere League"
  end
  
  def test_brute_force_search
    assert_equal(0, brute_force_search(@text, "English"))
    assert_equal(8, brute_force_search(@text, "Premiere"))
    assert_equal(17, brute_force_search(@text, "League"))
  end
end