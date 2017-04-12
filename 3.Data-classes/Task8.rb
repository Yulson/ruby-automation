#8. There is a hash where keys and values are strings.
#Modify it: all keys should be symbols and all values should be integers.
#If you couldn't modify some value set it to nil


hash = { "Jane Doe" => "10", "Jim Doe" => "0", "Janett Doe" => "child" }
 print hash.map{|key, value| {key.to_sym => value.to_i}}