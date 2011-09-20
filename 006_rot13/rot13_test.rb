require 'test/unit'
require 'rot13'

class ROT13Test < Test::Unit::TestCase
  
  def test_sentences
    assert_equal "The butler did it!",         rot13("Gur ohgyre qvq vg!")
    assert_equal "Programming Praxis is fun!", rot13("Cebtenzzvat Cenkvf vf sha!")  
  end
  
  def test_joke
    joke      = "How can you tell an extrovert from an introvert at NSA?"
    punchline = "In the elevators, the extrovert looks at the OTHER guy's shoes."
    
    assert_equal joke,      rot13("Ubj pna lbh gryy na rkgebireg sebz na vagebireg ng AFN?")
    assert_equal punchline, rot13("Va gur ryringbef, gur rkgebireg ybbxf ng gur BGURE thl'f fubrf.")
  end
  
  def test_words
    # http://www.furrfu.org/rot13words.html
    assert_equal "aha",  rot13("nun")
    assert_equal "ant",  rot13("nag")
    
    assert_equal "balk", rot13("onyx")
    assert_equal "bar",  rot13("one")
    assert_equal "barf", rot13("ones")
    assert_equal "be",   rot13("or")
    assert_equal "bin",  rot13("ova")

    assert_equal "clerk", rot13("pyrex")
    
    assert_equal "ebbs", rot13("roof")
    assert_equal "envy", rot13("rail")
    assert_equal "er",   rot13("re")
    assert_equal "errs", rot13("reef")

    assert_equal "flap",  rot13("sync")
    assert_equal "fur",   rot13("she")
    assert_equal "furby", rot13("sheol")
    
    assert_equal "gel",  rot13("try")
    assert_equal "gnat", rot13("tang")
    
    assert_equal "irk", rot13("vex")

    assert_equal "purely",  rot13("cheryl")
    assert_equal "png",     rot13("cat")
    assert_equal "purpura", rot13("chechen")
    
    assert_equal "sha",   rot13("fun")
    assert_equal "shone", rot13("fubar")
    
    assert_equal "terra", rot13("green")
    
    assert_equal "url", rot13("hey")
    
    assert_equal "what", rot13("jung")
  end
  
end
