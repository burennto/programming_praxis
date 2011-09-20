# Programming Praxis
# Exercise 2: Sieve of Eratosthenes
# http://programmingpraxis.com/2009/02/19/sieve-of-eratosthenes/
#
# Author: Brent Chuang
# Date:   2/1/2011

class Sieve
  def self.prime_numbers_below(target)
    list = (2..target).inject([]) { |numbers, n| numbers << n }
    
    # p list
    
    for n in (2..Math.sqrt(target))
      next if list.index(n).nil?
      (n**2).step(target, n) do |j|
        # print j.to_s + " "
        index = list.index(j)
        list[index] = nil if index
      end
      # puts "\n"
    end
    
    list.compact!
    list
  end
  
  def self.prime_numbers_below2(top)  
    sieve = []
    for i in 2 .. top
      sieve[i] = i
    end

    # p sieve

    for i in 2 .. Math.sqrt(top)
      next unless sieve[i]
      (i*i).step(top, i) do |j|
        sieve[j] = nil
      end
    end
    sieve.compact!
  end
end

# p Sieve.prime_numbers_below(30).length
# p Sieve.prime_numbers_below2(30).length

p Sieve.prime_numbers_below2(15485).length
p Sieve.prime_numbers_below(15485).length

# p Sieve.prime_numbers_below(15485863).length
