#7. There is an array of integers (ary). Modify it with adding ary[0] (first element of the array) to each even number.
# Don't do it for first and last elements


array = [10, 10, 20, 30, 11, 11, 11]

array.each_with_index do |element, i|
  array[i] = array[i] + array[0] if array[i].even?
  end
  print array

#the other option is save the array[0] as a constant and add it to all even elements. Because array[0] is changed if it is even.