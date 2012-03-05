require 'pp'

file = open("/Users/ivancherevko/Downloads/track1/rec_log_train.txt")

popularity = Hash.new([0, 0])

array = []

file.each_line do |line|
	user, item, result, stamp = line.split("\t")
	user, item, result = user.to_i, item.to_i, result.to_i

	popularity[item] = [popularity[item][0] + (result == 1 ? 1 : 0), popularity[item][1]+1]
end

puts popularity.sort_by{|x| x[1]}.reverse.map{|x| x.flatten.join("\t")}