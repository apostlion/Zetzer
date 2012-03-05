require 'pp'

file = open("/Users/ivancherevko/Downloads/track1/user_key_word.txt")

users = []

file.each_line do |line|
	id, keys = line.split("\t")
	keys = keys.split(';').map{|x| x.split(':')[1].to_f}
	users << [keys.length, keys.inject(0){|s,v| s+v}, keys.inject(0){|s,v| s+v}/keys.length]
end

puts users.map{|x| x.join("\t")}.join("\n")