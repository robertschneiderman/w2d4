def my_min(array)
  array.each do |el|
    return el if array.select {|el2| el2 > el }.count == array.count - 1
  end
end

# list = (0..100).to_a.reverse
# time = Time.now
# 1000.times { my_min(list) } # =>  -5
# one_time = Time.now - time
#
# list = (0..10).to_a.reverse
# time = Time.now
# 1000.times { my_min(list) } # =>  -5
# two_time = Time.now - time
#
# puts "#{ one_time / two_time }"


def my_min_tracking(array)
  minimum = array.first
  array.each do |el|
    minimum = el if el < minimum
  end
  minimum
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90, -500 ]
# puts my_min_tracking(list)

def largest_contiguous_subsum1(arr)

  str_length = 1
  largest_sum = 0

  until str_length == arr.count
    (0...arr.count).each do |cur_i|
      sum = arr[cur_i..cur_i+str_length].inject(:+)
      largest_sum = sum if sum > largest_sum
    end
    str_length += 1
  end

  largest_sum
end

list = [5, 3, -7, 9, -1]
largest_contiguous_subsum1(list) # => 8
#
# # possible sub-sums
# [5]           # => 5
# [5, 3]        # => 8 --> we want this one
# [5, 3, -7]    # => 1
# [3]           # => 3
# [3, -7]       # => -4
# [-7]          # => -7


def largest_contiguous_subsum2(array)
  largest = 0
  current = 0

  array.each do |el|
    current += el
    largest = current if current > largest
    current = 0 if current < 0
  end

  largest
end

p largest_contiguous_subsum2((1..1_000_000).to_a)
