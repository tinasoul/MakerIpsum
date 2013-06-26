require 'twitter'


# Twitter.configure do |config|
#   config.consumer_key = ENV['CONFIG_CONSUMER_KEY']
#   config.consumer_secret = ENV['CONFIG_CONSUMER_SECRET']
#   config.oauth_token = ENV['CONFIG_OAUTH_TOKEN']
#   config.oauth_token_secret = ENV['CONFIG_OAUTH_TOKEN_SECRET']
# end


Twitter.configure do |config|
config.consumer_key = "Uj8AmbADJc2IuMrBG5RRfA"
config.consumer_secret = "lxZEStujxJ8WE2MOtqhIVGM9RoDsO6Nebxn11uuV3I"
config.oauth_token = "393197771-bvrAL4uYsQVnuJlkvKiB1C1Gg7Zn3yXWbUqIvyjh"
config.oauth_token_secret = "vgdGVhkXxIRhkFLzaKWDcA6qXre76msZHaT4zZonQ"
end


ipsum = ["that's so bootstrap", "HAHA business", "alright alright", "I don't speak frat", "dogs drink superwater", "devhouse party", "D-Money", "ruby redbird", "git push origin master", "git push and coast"]
		
Twitter.search("#makeripsum", :count => 10000).results.map do |tweet|
	orig_string = tweet.full_text
	split_string = orig_string.split(" ")
	split_string.reject! do |word|
		# word == "#makeripsum" or word == "@makersquare" or --looks for exactness which is what we don't want!
		word.include?("@") or word.include?("#") or word.include?("RT")	or word.include?("http") or word.include?("&")
	end	
	 joined_string = split_string.join(" ")
	 ipsum << joined_string
end

puts "How many paragraphs do you want?"

answer = gets.chomp.to_i

answer.times do
		puts "\n"
		ipsum.sample(20).each do |thing|
			print "#{thing} "
		end
end





# 	array_of_words = a.split(' ')
# 	# array of words could be ['hey', 'whats', 'up', '@makersquare']
# 	array_of_words.delete_if do |word|
# 		# Last line should be true if you want to remove from array
# 	end
# 	# array of words should be ['hey', 'whats', 'up']
# 	a.split.delete_if{|string| array.include?("#")}.join(' ')
# end

# array.delete_if do |x|
# 	x.blah
# end

# array.each {|x| x.blah}


# 

# ipsum = []

# puts "How many paragraphs do you want?"

# answer = gets.chomp.to_i

# answer.times {5.times {ipsum.sample(5).each do |thing|
# 	print "#{thing} "
# end} 


# How many paragraphs do you want?
# # 	gets answer
# i.e. # if 3 then run above loop 3 times

# sentence = ipsum.sample(5).join(" ")
# puts sentence
# 5.times {print sentence} ----> prints the SAME sentence in a row 5 times
