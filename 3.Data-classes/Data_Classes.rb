

#1. Create a method which will take a natural number as an argument and will find a sum of all its digits
  def sum_of_numbers(natural_number="93846675")
    array = natural_number.each_char.to_a
    index = 0
    sum = 0
    while index <= array.count
      sum = sum + array[index].to_i
      index = index + 1
    end
    puts sum
  end

puts "method #1"
sum_of_numbers
sum_of_numbers("111")





#2. There is a string. Find a maximum number of digits placed in a row in it
  def find_max_number_of_digits(string="00 000 0")
    array = string.gsub(/[^\d]/, '|').split('|')
    max_number_of_digits = Array.new
    array.each {|el| max_number_of_digits.push(el.length) }
    puts max_number_of_digits.max
  end

puts "method #2"
find_max_number_of_digits
find_max_number_of_digits("lalala oo jket 99hejjjruuc")





#3. There is a string. Find a maximal number (not a digit) in it
  def max_number_in_string(string="89563 4777 10")
    array = string.gsub(/[^\d]/, '|').split('|')
    new_array = Array.new
    array.each {|el| new_array.push(el.to_i) }
    puts new_array.max
  end

puts "method #3"
max_number_in_string
max_number_in_string("8956679 76544 88")





#4. There are two strings. Find number of first chars from first string matching first chars of the second string. Consider two cases:
#strings are definitely different
#strings can completely match
def find_number_of_first_chars(string1="First string", string2="Second string")
  arr1 = string1.split('')
  arr2 = string2.split('')
  counter = 0
  arr1.each_with_index do |el, i|
    if arr1[i] == arr2[i]
      counter +=1
      else next
    end
  end
  print counter
end

puts "method #4"
puts find_number_of_first_chars
puts find_number_of_first_chars("Wow, cucumber", "Wow, cucumber")





# 5. There is an array of integers. First puts elements with even indexes and then with odd indexes
  # def push_index(array, ind)

  def sort_indexes(arr_of_integers=[1, 8, 3, 16, 11, 100])
    odd_arr = []
    even_arr = []
    i = 0
    arr_of_integers.length.times do
      if i.odd?
        odd_arr.push(arr_of_integers[i])
      else
        even_arr.push(arr_of_integers[i])
      end
      i += 1
    end
    puts "Elements with odd indexes: " + odd_arr.to_s
    puts "Elements with even indexes: " + even_arr.to_s
  end

 puts "method #5"
 puts sort_indexes
 puts sort_indexes([7, 4, 83, 902, 6, 7, 46])





#6. There is an array of integers (ary). Puts the index of the last element where ary[0]<ary[i]<ary[-1]
def find_index_of_element(arr=[120, 34, 12, 127, 12, 123, 140])
  results_arr = Array.new
  arr.each_with_index do |el, i|
    results_arr.push(i) if (arr[i] > arr[0]) && (arr[i] < arr[-1])
  end
  print results_arr.last
end

puts "method #6"
puts find_index_of_element





#7. There is an array of integers (ary). Modify it with adding ary[0] (first element of the array) to each even number.
# Don't do it for first and last elements
def modify_array(arr=[1, 2, 3, 2, 3, 2, 3, 1])
  range = (1...(arr.length - 1))
    arr.each_with_index do |el, i|
      if range.include?(i) && el.even?
        arr[i] += arr[0]
      end
  end
  print arr
end

puts "method #7"
puts modify_array





# 8. There is a hash where keys and values are strings.
# Modify it: all keys should be symbols and all values should be integers.
# If you couldn't modify some value set it to nil
def transform_value(value)
  if value.to_i.to_s == value
    value = value.to_i
  else
    value = nil
  end
end


def modify_hash(sample_hash={})
  sample_hash.each_pair {|key, value| {key.to_sym => value = transform_value(value)}}
end

puts "method #8"
puts modify_hash({"Jane Doe" => "10", "Jim Doe" => "6", "Roak" => "cocos"})





#9. There is a hash where keys are symbols and values are integers.
#Modify it: remove all pairs where symbols start with "s" character
def remove_pairs_from_hash(hash = {salan: 0, bob: 11, scolin: 5.13, dany:0, robert: 6})
  s = "s"
  print hash.select {|k,v| k[0]!= s}
end

puts "method #9"
puts remove_pairs_from_hash





#10. There is a hash where keys are symbols and values are integers.
#Modify it: leave only pairs where value is natural number and more than 0
def leave_pairs_in_hash(hash = {alan: 12, bob: 137, colin: 0, dany: 51.9, eatan: 0, fred: 2.11})
  hash.select! {|k,v| v > 0 }
  print hash.select! {|k,v| v.integer?}
end

puts "method #10"
puts leave_pairs_in_hash

