#3. There is a string. Find a maximal number (not a digit) in it
puts "Enter any string"
string = gets
array = string.gsub(/[^\d]/, '|').split('|')
new_array = Array.new
array.each {|el| new_array.push(el.to_i) }
puts new_array.max
