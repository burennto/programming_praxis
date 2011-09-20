require 'test/unit'
require '../josephus'

class JosephusTest < Test::Unit::TestCase
  
  def test_5_people_killing_in_sequence
    assert_equal 3, josephus(3, 1)
  end
  
  def test_5_people_killing_every_3rd
    assert_equal 4, josephus(5, 3)
  end
  
  def test_5_people_killing_every_4th
    assert_equal 1, josephus(5, 4)
  end

  def test_40_people_killing_every_3rd
    assert_equal 28, josephus(40, 3)
  end
  
  def test_41_people_killing_every_3rd
    assert_equal 31, josephus(41, 3)
  end
  
  def test_39_people_killing_every_7th
    assert_equal 17, josephus(39, 7)
  end
end
