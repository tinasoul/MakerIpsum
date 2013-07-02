require 'twitter'

class Ipsum

  @@dummy_ipsum= []
  @@sentences_per_paragraph = 4


  def self.configure
    Twitter.configure do |config|
      config.consumer_key = ENV['CONFIG_CONSUMER_KEY']
      config.consumer_secret = ENV['CONFIG_CONSUMER_SECRET']
      config.oauth_token = ENV['CONFIG_OAUTH_TOKEN']
      config.oauth_token_secret = ENV['CONFIG_OAUTH_TOKEN_SECRET']
    end
  end

  def self.clean_tweet(tweet)
    # 1) Remove white space and emojis
    # 2) Remove twitter words
    # 3) Remove remaining white spaces
    twitter_array = tweet.text.gsub(/^\s+/," ")  # remove leading spaces
    twitter_array.gsub!(/\s+$/,'')  # remove trailing spaces
    twitter_array.gsub!(/\\U\+\S*\b/, " ") # remove emojis
    split_string = twitter_array.split(" ")
    split_string.reject! do |word|
        word.include?("#") or word.include?("RT") or word.include?("http") or word.include?("@") or word.include?("&lt") or word.include?("&amp") 
    end 
    joined_string = split_string.join(" ")
    int_string = joined_string.gsub(/^\s+/," ")  # remove leading spaces after removing the stuff on line 26
    int_string.gsub!(/\s+$/,'')  # remove trailing spaces after removing the stuff on line 28
  end

  def self.search_twitter
    Twitter.search(@@hashtag_request, :count => 10000).results.each do |tweet| #how do we include all tweets without setting a max count
      clean_tweet = self.clean_tweet(tweet)
      @@dummy_ipsum << clean_tweet
    end
  end

  # Play without twitter uncomment lines 48-51 and comment lines 5 through 28 out
  # ________________________________________

  # def self.play

    # puts "Welcome to Makeripsum! How many paragraphs do you want?"

    # @@number_of_paras = gets.chomp.to_i
    # puts " "

    # self.make_block

  # end

  def self.make_block
   @@number_of_paras.times do 
      @block = make_para
      #variable assignment in the do block makes it work!
      puts "\n\n"
    end
    print @block
  end

  def self.make_para
    @@sentences_per_paragraph.times do
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

    @@cap_sentence = raw_sentence.capitalize

    print @@cap_sentence

  end 

  def self.get_hashtag
    puts "Type a twitter hashtag (with the # symbol), and we'll build an ipsum made of tweets from this hashtag!"

    @@hashtag_request = gets.chomp
  end

  def self.get_para_count
    puts "Thank ya much. How many paragraphs of #{@@hashtag_request} do you want?"
    @@number_of_paras = gets.chomp.to_i
    puts
  end

  # def print_ipsum



  # end

  def self.execute
    self.configure
    puts "\nWelcome to Make Your Ipsum.\n"
    self.get_hashtag
    self.search_twitter
    puts
    self.get_para_count
    self.make_block
  end

end


Ipsum.execute