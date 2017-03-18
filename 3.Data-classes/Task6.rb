#6. There is an array of integers (ary). Puts the index of the last element where ary[0]<ary[i]<ary[-1]

array = [123, 888, 3, 220, 124, 125, 228, 9900, 338884, 984, 230]
results_array = Array.new
array.each_with_index do |element, i|
  results_array.push(i) if (array[i] > array[0]) && (array[i] < array[-1])
end
  print results_array.last
