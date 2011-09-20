# 689
# 1961

# Your task is to find the next upside up number greater than 1961,
# and to count the number of upside up numbers less than ten thousand.

# 0, 1, 6, 8, 9

class Ex240

  # Question 1
  def first_number_over target
    begin
      target += 1
    end until is_upside_up?(target)
    target
  end

  # Question 2
  def occurrences_between(range)
    occurrences = range.reduce([]) do |keep, n|
      keep << n if is_upside_up?(n)
      keep
    end
    occurrences.length
  end

  private
    
    def is_upside_up? num
      num = num.to_s unless num.is_a?(String)
      return false if num =~ /2|3|4|5|7/

      if num.length == 0
        true
      elsif num.length == 1
        num !~ /6|9/ ? true : false
      else
        if is_valid_pair?(num[0].to_i, num[-1].to_i)
          is_upside_up?( num.slice!( 1, num.length-2 ) )
        else
          false
        end
      end
    end

    def is_valid_pair? x, y
      return true if [x, y].eql? [0, 0]
      return true if [x, y].eql? [1, 1]
      return true if [x, y].eql? [8, 8]
      return true if [x, y].sort.eql? [6, 9]
      false
    end
end

puts Ex240.new.first_number_over 1961
puts Ex240.new.occurrences_between 1..10_000
