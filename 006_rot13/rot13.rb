# Programming Praxis
# Exercise 6: ROT13
# http://programmingpraxis.com/2009/02/20/rot13/
#
# Author: Brent Chuang
# Date:   3/1/2011

# Notes:
# Cool implementation seen at http://programmingpraxis.com/2009/02/20/rot13/
#
# class String
#   def rot13
#     self.tr('A-Za-z.!(),', 'N-ZA-Mn-za-m.!(),')
#   end
# end

UPPERCASE = (65 .. 90).freeze
LOWERCASE = (97 .. 122).freeze

def rot13 plain
  char_code = []
  encoded = []
  
  plain.each_char do |c|
    ascii = c[0]
    
    if UPPERCASE.include?(ascii)
      shifted = ascii + ( closer_to_uppercase_a?(ascii) ? 13 : -13 )
      encoded << shifted.chr
    elsif LOWERCASE.include?(ascii)
      shifted = ascii + ( closer_to_lowercase_a?(ascii) ? 13 : -13 )
      encoded << shifted.chr
    else
      encoded << c
    end
  end
  
  encoded.join("")
end

private
  
  def closer_to_uppercase_a? ascii
    (UPPERCASE.first - ascii).abs < (UPPERCASE.last - ascii).abs
  end
  
  def closer_to_lowercase_a? ascii
    (LOWERCASE.first - ascii).abs < (LOWERCASE.last - ascii).abs
  end
