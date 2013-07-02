class Ipsum

  @@dummy_ipsum= []

require 'twitter'


Twitter.configure do |config|
  config.consumer_key = ENV['CONFIG_CONSUMER_KEY']
  config.consumer_secret = ENV['CONFIG_CONSUMER_SECRET']
  config.oauth_token = ENV['CONFIG_OAUTH_TOKEN']
  config.oauth_token_secret = ENV['CONFIG_OAUTH_TOKEN_SECRET']
end

  def self.search_twitter

  Twitter.search(@@hashtag_request, :count => 10000).results.each do |tweet| #how do we include all tweets without setting a max count
  # puts tweet.text  
  twitter_string = tweet.text.gsub(/^\s+/,"")  # remove leading spaces
  twitter_string.gsub!(/\s+$/,"")  # remove trailing spaces
  twitter_string.gsub!(/\\U\+\S*\b/,"") # remove emojis
  # twitter_string.gsub!(/[\u1F300-\u1F5FF]+/,"") # remove emojis
  split_array = twitter_string.split(" ")
  split_array.reject! do |word|
      word.include?("#") or word.include?("RT") or word.include?("http") or word.include?("@") or word.include?("&lt") or word.include?("&gt") or word.include?("&amp") 
      end 
  joined_string = split_array.join(" ")
  @@int_string = joined_string.gsub(/^\s+/,"")  # remove leading spaces after removing the stuff on line 26
  @@int_string.gsub!(/\s+$/,"")  # remove trailing spaces after removing the stuff on line 28
  @@dummy_ipsum << @@int_string
    end
  end

  def self.make_block
   @@number_of_paras.times do 
      @block = make_para
      #variable assignment in the do block makes it work!
      puts " "
      puts " "
    end
    print @block
  end

  def self.make_para
    4.times do
      @paragraph = make_sentence
    end
    print @paragraph
  end

  def self.make_sentence
    raw_array = @@dummy_ipsum.sample(rand(5..7))
  
    last = raw_array.last

      if last.include?(".") or last.include?("?") or last.include?("!") or last.include?("...")
      punc_last_array_item = last + " " else
      punc_last_array_item = last + ". "
      end

    # punc_last_array_item = last + "&&" unless last.include?(".") or last.include?("?") or last.include?("!") or last.include?("...") 
    # This unless syntax was not working with multiple ors!

    raw_array.pop

    @@rev_array = raw_array << punc_last_array_item

    raw_sentence = @@rev_array.join(" ")

    @cap_sentence = raw_sentence.capitalize

    print @cap_sentence

  end 

  puts " "
  puts "Welcome to Make Your Ipsum. You're about to get custom ipsum for your website so you can mock up beautiful websites!"
  puts " "
  puts "Type a twitter user handle or hashtag (with the @ or # symbol), and we'll build an ipsum made of current tweets associated."

  @@hashtag_request = gets.chomp
  self.search_twitter

    if @@int_string.empty?
      puts "try again"
    end 

  puts " "
  puts "Thank ya much. How many paragraphs of #{@@hashtag_request} do you want?"

  @@number_of_paras = gets.chomp.to_i

  puts " "
  self.make_block

end






