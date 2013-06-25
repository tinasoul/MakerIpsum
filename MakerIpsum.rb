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
# CSV.open("tweets.csv","wb") do |csv|
#  		csv << ["handle", "text", "url"]


ipsum = ["that's so bootstrap", "HAHA business", "alright alright", "I don't speak frat", "dogs drink superwater", "devhouse party", "D-Money", "ruby redbird", "git push origin master", "git push and coast"]

# puts "How many paragraphs do you want?"

# answer = gets.chomp.to_i

# answer.times {5.times {ipsum.sample(5).each do |thing|
# 	print "#{thing} "
# end} }
		
Twitter.search("#makeripsum").results.map do |tweet|
	ipsum << [tweet.full_text]
	if tweet.full_text == *'@' && *'#' && *'&lt'
	puts ipsum
	end

# def hashtags
#   @hashtags ||= entities(Twitter::Entity::Hashtag, :hashtags)
# end

# How many paragraphs do you want?
# # 	gets answer
# i.e. # if 3 then run above loop 3 times

# sentence = ipsum.sample(5).join(" ")
# puts sentence
# 5.times {print sentence} ----> prints the SAME sentence in a row 5 times
