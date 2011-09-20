# Programming Praxis
# Exercise 20: Rail-Fence Cipher
# http://programmingpraxis.com/2009/03/31/rail-fence-cipher/
#
# Author: Brent Chuang
# Date:   7/1/2011

module RailFenceCipher
  def self.encipher cleartext, key
    raise "Not a valid string: #{cleartext.inspect}" if cleartext.class != String
    raise "Not a valid integer: #{key.inspect}"      if key.class != Fixnum
    
    pickets = Array.new
    height = key
    direction = :down
    ciphertext = String.new
    
    # each character is a picket, height ranges from 1 ~ key
    cleartext.each_char do |char|
      pickets << { :char => char, :height => height }
      
      height -= 1 if direction == :down
      height += 1 if direction == :up
      
      direction = :up   if height == 1
      direction = :down if height == key
    end
    
    # build ciphertext based on picket height, from tallest to shortest
    key.downto(1) do |height|
      row = pickets.select { |picket| picket[:height] == height }
      row.each { |picket| ciphertext << picket[:char] }
    end
    
    ciphertext
  end
  
  def self.decipher ciphertext, key
    raise "Not a valid string: #{cleartext.inspect}" if ciphertext.class != String
    raise "Not a valid integer: #{key.inspect}"      if key.class != Fixnum
    
    pickets = Array.new
    height = key
    cleartext = String.new
    
    ciphertext.each_char do |char|
      
    end
  end
end

cleartext = "PROGRAMMING PRAXIS"
ciphertext = RailFenceCipher::encipher(cleartext, 4)

puts "Cleartext:  #{cleartext}"
puts "Ciphertext: #{ciphertext}"
