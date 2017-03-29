#9. There is a hash where keys are symbols and values are integers.
#Modify it: remove all pairs where symbols start with "s" character

given_hash = {salan: 0, bob: 11, scolin: 5.13, dany:0, robert: 6}
s = "s"
puts given_hash.select {|k,v| k[0]!= s}

