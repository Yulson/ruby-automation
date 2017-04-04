#5. There is an array of integers. First puts elements with even indexes and then with odd indexes

puts 'Enter a string with integers'
ary = gets.each_char.to_a
even_arry = Array.new
odd_arry = Array.new

for i in 0..(ary.length - 1) do
  if i.odd?
    odd_arry.push(ary[i])
  else
    even_arry.push(ary[i])
  end
end
  puts "Elements with even indexes"
  puts even_arry.to_s
  puts "Elements with odd indexes"
  puts odd_arry.to_s