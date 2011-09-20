# Programming Praxis
# Exercise 12: Creation
# http://programmingpraxis.com/2009/03/03/creation/
#
# Author: Brent Chuang
# Date:   4/1/2011

module XORCipher
  
  # Strategy (as suggested by the exercise solution)
  
  # The key is fixed and has length n (n < 20).
  #
  # By picturing the plain text in units of n characters long, we know that each nth character
  # in each section was ciphered by the same key character.
  #
  # e.g. Plain Text: ALLYOURBASEAREBELONGTOUS
  #      Key (MISO): MISOMISOMISOMISOMISOMISO
  #
  # By dividing the cipher text into n stripes, each stripe will contain all the characters
  # that were ciphered by a particular key character.
  #
  # Find the most frequently occuring character in each strip and assume its plain text before
  # the XOR Cipher represented the space character (ASCII ordinal 32).
  #
  # Calculate each key character by using XOR between the plain and cipher character.
  #
  # Repeat for all possible n values to find the real key.

  FILE       = 'encrypted.txt'
  KEY_LENGTH = 1 .. 20
  SPACE_CHARACTER_ASCII = " "[0].ord

  def self.crack_key
    ciphertext = File.open(FILE, "r").readline.chomp!.split(' ')

    KEY_LENGTH.each do |length|
      stripes = Array.new(length) { Array.new }

      ciphertext.each_index do |index|
        stripes[index%length] << ciphertext[index]
      end

      # find most frequently occuring character and XOR with space character
      key = stripes.map do |stripe|
        freq = stripe.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
        most = stripe.sort_by { |v| freq[v] }.last
        (most.to_i ^ SPACE_CHARACTER_ASCII).chr
      end

      puts "#{length} character key: #{key.join}"
    end
  end
  
  
  def self.decode key
    puts "Key: #{key}\n\n"
    
    plaintext = ""
    
    ciphertext = File.open(FILE, "r").readline.chomp!.split(' ')
    ciphertext.each_index do |i|
      character = ciphertext[i].to_i ^ key.split('')[i%key.length][0].ord.to_i
      plaintext << character.chr
    end
    
    puts "Decoded plaintext:\n\n"
    puts plaintext
  end
  
end


XORCipher::crack_key
puts "\n"
XORCipher::decode("Genesis")

  # def most_frequently_occuring array
  #   freq = array.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
  #   most = array.sort_by { |v| freq[v] }.last
  #   most
  # end
  
  # encode(plaintext, key)    plaintext => ciphered ASCII ordinals
  # decode(ordinals, key)     ciphered ASCII ordinals => plaintext
  
  # Didn't implement plaintext => cipher text or vice versa because some ciphered ASCII
  # ordinals don't display properly as characters (as mentioned in the exercise description)
  
  # The onscreen result from an encode won't always decode to the original plaintext.
  # The ASCII ordinals however, are consistent.
  
  # def encode plaintext, key
  #     cipher_ordinals = apply( to_ascii_ordinals(plaintext), to_ascii_ordinals(key) )
  #     
  #   end
  #   
  #   def decode ordinals, key
  #     cipher_ordinals = apply(ordinals, to_ascii_ordinals(key) )
  #     to_plaintext(cipher_ordinals)
  #   end
  #   
  #   
  #   # def apply plaintext, key
  #   #     # pair each character ordinal with the corresponding key ordinal that it will XOR with
  #   #     xor_pairs = []
  #   #     plaintext.split('').each_index do |index|
  #   #       char     = plaintext[index]
  #   #       key_char = key[index%key.length]
  #   #       
  #   #       xor_pairs << [ char, key_char ]
  #   #     end
  #   #     
  #   #     # apply the XOR
  #   #     ciphered_ordinals = xor_pairs.map do |pair|
  #   #       pair[0] ^ pair[1]
  #   #     end
  #   #     
  #   #     ciphered_ordinals.map! { |ascii| ascii.chr }
  #   #     
  #   #     ciphered_ordinals.each do |c|
  #   #       print c
  #   #     end
  #   #     
  #   #   end
  #   
  #   private
  #   
  #     def to_ascii_ordinals plaintext
  #       plaintext.split('').inject([]) { |ordinals, char| ordinals << char.unpack('c').first }
  #     end
  #   
  #     def apply_cipher ordinals, key_ordinals
  # 
  #       # xored_ordinals = []
  #       # 
  #       #       # apply XOR cipher
  #       #       ordinals.each_index do |i|
  #       #         ascii_of_character = ordinals[i].unpack('c').first
  #       #         ascii_of_key       = key[i%key.length].unpack('c').first
  #       # 
  #       #         # p ascii_of_character
  #       # 
  #       #         xored_ordinals << (ascii_of_character ^ ascii_of_key)
  #       #       end
  #       # 
  #       #       xored_ordinals
  #     end
  #   
  # end
  # 
  # include XORCipher
  # message = "All your base are belong to us."
  # message = "R7NH$R*RH0I"
  # XORCipher::encode(message, "Engrish")
  # 
  # require 'test/unit'
  # 
  # class XORCipherTest < Test::Unit::TestCase
  #   include XORCipher
  #   
  #   def test_encode
  #     message = "All your base are belong to us."
  #     # message = 'R7NH$R*RH0IF'
  #     
  #     assert_equal 1, encode(message, "Engrish")
  #   end
  # 
  # end

# def decipher(cipher_text, key_length)
#   strips = Array.new(key_length) { Array.new }
# 
#   cipher_text.each_index do |index|
#     # print ascii.to_i.chr
#     strips[index%key_length] << cipher_text.shift
#   end
# 
#   strips.each do |strip|
#     # puts strip.count(" ").to_s + " out of " + strip.count.to_s + " letters are spaces."
#     freq = strip.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
#     most = strip.sort_by { |v| freq[v] }.last
#     puts "#{most} is the most frequent occuring character"
#   end
# end

# FILE = "encrypted.txt"
# encrypted = File.open(FILE, "r").readline.chomp!.split(" ")
# 
# KEY = "Genesis".split('')
# 
# encrypted.each_index do |i|
#   n = i%KEY.length
#   print (encrypted[i].to_i ^ KEY[n][0].to_i).chr
# end

