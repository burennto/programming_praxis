def n n
  primes = Array.new
  2.upto(n).each do |number|
    primes << number if is_prime?(number)
  end
  primes.count
end

private
  def is_prime? n
    2.upto(n-1).each do |number|
      return false if n%number == 0
    end
    true
  end




p n(100)