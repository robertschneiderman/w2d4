require 'byebug'

def anagram_cool_solution?(word1, word2)
  intersection = word1.chars & word2.chars
  return false if intersection.empty?
  intersection.count == word1.chars.count
end

def anagram_linear?(word1, word2)
  letter_count1 = get_letter_count(word1)
  letter_count2 = get_letter_count(word2)

  letter_count1 == letter_count2

  p word1.chars & word2.chars

end

def get_letter_count(word)
  count = Hash.new(0)

  word.each_char do |let|
    count[let] += 1
  end

  count
end

def first_anagram(word1, word2)
  perms = word1.split("").permutation(word1.chars.count)
  perms.include?(word2.split(""))
end


# p first_anagram("gizmo", "sally")    #=> false
# p first_anagram("elvisisagtt", "agislittves")    #=> true

def deleting_anagram(word1, word2)
  # debugger
  arr1 = word1.chars
  arr2 = word2.chars
  word1.chars.each_with_index do |char, idx|
    if arr2.include?(char)
      index = arr1.find_index(char)
    end
    arr1.delete_at(index)
  end
  arr1.empty?
end

# p deleting_anagram("ellvis", "lives")    #=> true

def anagrams_sorted_method(w1, w2)
  w1.chars.sort == w2.chars.sort
end

# p anagrams_sorted_method("elvis", "lives")    #=> true

def anagrams_one_hash(w1, w2)
  letter_count = Hash.new(0)
  concat = w1 + w2

  w1.chars.each do |char|
    letter_count[char] += 1
  end
  w2.chars.each do |char|
    letter_count[char] -= 1
  end
  letter_count.values.all? {|num| num == 0 }
end

p anagrams_one_hash("ellvis", "llives")    #=> true
