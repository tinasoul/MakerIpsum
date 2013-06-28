require 'twitter'


Twitter.configure do |config|
	config.consumer_key = ENV['CONFIG_CONSUMER_KEY']
	config.consumer_secret = ENV['CONFIG_CONSUMER_SECRET']
	config.oauth_token = ENV['CONFIG_OAUTH_TOKEN']
	config.oauth_token_secret = ENV['CONFIG_OAUTH_TOKEN_SECRET']
end


dummy_ipsum = ["that's so bootstrap", "HAHA business", "alright alright", "I don't speak frat", "dogs drink superwater", "D-Money", "ruby redbird", "chi'lantro", "git push and coast"]

ipsum = []

india = ["limbu paani", "pav baji", "Amitabh Bachchan", "bollywood", "shah", "patel", "parekh", "dot on your forehead", "elephant", "monkey", "rickshaw", "brown people spicy?", "bhangra","curry", "mangoooooo", "Snapshot India", "slumdog app developer", "thank you come again", "hotel/motel", "aunty"]


  puts "What ipsum do you want. Enter a twitter hashtag"
  @response= gets.chomp

Twitter.search(@response, :count => 10000).results.each do |tweet| #how do we include all tweets without setting a max count
  orig_string = tweet.full_text
  split_string = orig_string.split(" ")
  split_string.reject! do |word|
    # word == "#makeripsum" or word == "@makersquare" or --looks for exactness which is what we don't want!
    word.include?("#") or word.include?("RT") or word.include?("http") or word.include?("&") or word.include?("@")
  end 
  joined_string = split_string.join(" ")
  ipsum << joined_string
end


puts "How many paragraphs do you want?"

answer = gets.chomp.to_i

puts "With a shot of India? (yes or no)"

answer2 = gets.downcase.chomp

if answer2.chars.first == "y"
	ipsum.concat(india)
	answer.times do
		puts "\n"
		puts "\n"
		ipsum.sample(21).each do |thing|
			print "#{thing} "
			# can we create a method that does this so we don't repeat code.	
		end
	end	

elsif
	answer.times do
		puts "\n"
		puts "\n"
      ipsum.sample(21).each do |thing|
        print "#{thing} "
      end
    end

else 
     puts "Please enter a different hashtag; there are not enough tweets with that hashtag."  
end

# if ipsum == [] 
#       puts "Please enter a different hashtag; there are not enough tweets with that hashtag"
#       # rev_ipsum = dummy_ipsum.sample(20)
#       # print rev_ipsum.join(" ")
#     else



#Next steps:
# Capitalize first work in para and end each para with a "."



# Shehzan breaking is down for us

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



# Original ruby code before we linked to twitter api 

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
