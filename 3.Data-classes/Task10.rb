#10. There is a hash where keys are symbols and values are integers.
#Modify it: leave only pairs where value is natural number and more than 0

hash = { alan: 12, bob: 137, colin: 0, dany: 51.9, eatan: 0, fred: 2.11}
puts hash.select! {|k,v| v > 0 }
puts hash.select! {|k,v| v.integer?}