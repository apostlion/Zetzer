require 'pp'

file = open("/Users/ivancherevko/Downloads/track1/rec_log_train.txt")

probabilities = Hash.new(0)
counter = 0

array = []

file.each_line do |line|
	user, item, result, stamp = line.split("\t")
	user, item, result = user.to_i, item.to_i, result.to_i
	if array.length < 3
		array << result
	else
		array = array.sort
		probabilities[array] += 1
		counter += 1
		pp probabilities if counter % 10000 == 0
		array = []
	end
end

pp probabilities