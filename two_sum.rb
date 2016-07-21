require 'byebug'
require 'set'

def bad_two_sum(array, target)
  combinations = []
  array.each_with_index do |num1, idx|
    array.each_with_index do |num2, idx2|
      if idx != idx2
        combinations << [num1, num2] if num1 + num2 == target
      end
    end
  end
  combinations.any?
end

arr = [1, 2, 6, 7]

# p bad_two_sum(arr, 6)
# p bad_two_sum(arr, 10)

def okay_two_sum?(arr, target)
  # debugger
  arr.sort!
  middle = arr.count / 2

  i = (middle - 1)
  j = middle

  until i < 0 || j == arr.count
    case (arr[i] + arr[j]) <=> target
    when -1
      j += 1
    when 0
      return true
    when 1
      i -= 1
    end
  end
  false
end

# arr = [1, 2, 5, 7]
arr = [5, 2, 1, 7]

def good_two_sum?(array, target)
  # values = Set.new
  values = {}
  array.each do |el|
    values[el] = true
    return true if values[target - el]
  end
  false
end

p good_two_sum?(arr, 6)
