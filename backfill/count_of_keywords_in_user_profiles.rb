require 'pp'

file = open("/Users/ivancherevko/Downloads/track1/user_key_word.txt")

keywords = Hash.new(0)

file.each_line do |line|
	id, keys = line.split("\t")
	keys = keys.split(';').map{|x| x.split(':')[0]}
	keys.each do |key|
		keywords[key] ||= 0
		keywords[key] += 1
	end
end

pp keywords.sort_by{|x| x[1]}.reverse