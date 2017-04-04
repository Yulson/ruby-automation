#4. There are two strings. Find number of first chars from first string matching first chars of the second string. Consider two cases:
#strings are definitely different
#strings can completely match

puts "Enter first String"
arr1 = gets.split(' ')
puts "Enter second String"
arr2 = gets.split(' ')

counter = 0
arr1.each_with_index do |element, i|
  if arr1[i] == arr2[i]
    counter += 1
  else next
  end
end
print counter



