require 'pp'

file = open("/Users/ivancherevko/Downloads/track1/rec_log_train.txt")

match = {}
changed_opinions = 0
double_usage = 0

file.each_line do |line|
	user, item, result, stamp = line.split("\t")
	user, item, result = user.to_i, item.to_i, result.to_i
	double_usage += 1 if match[[user, item]]
	puts double_usage if double_usage % 10000 == 0
	match[[user, item]] ||= 0
	if 0 == match[[user, item]] + result
		changed_opinions += 1
		puts "#{changed_opinions}: #{double_usage} -> #{changed_opinions.to_f / double_usage}"
	end
	match[[user, item]] = result
end