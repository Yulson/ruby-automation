#2. There is a string. Find a maximum number of digits placed in a row in it
puts "Enter any string"
string = gets
array = string.gsub(/[^\d]/, '|').split('|')
new_array = Array.new
array.each {|el| new_array.push(el.length) }
puts new_array.max








