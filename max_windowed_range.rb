def max_window_range(array, w_size)
  # array.sort!
  # windows = Hash.new(0)
  # array.each_index do |idx|
  #   next if idx + w_size > array.count - 1
  #   window_arr = array[idx..idx + w_size - 1]
  #   windows[idx] = window_arr.max - window_arr.min
  # end
  # windows.values.max

  largest_range = 0

  array.each_index do |i|
    end_i = (i + w_size) - 1

    window = array[i..end_i].sort
    range = window.last - window.first
    largest_range = range if range > largest_range
  end

  largest_range
end

arr = [2, 4, 5, 3, 2, 1, 10]
p max_window_range(arr, 3)
