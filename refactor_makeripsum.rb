class Ipsum
  @@dummy_ipsum = ["that's so bootstrap","HAHA Business!","alright, alright","I don't speak frat.","dogs drink superwater","D-Money","ruby redbird","chi'lantro?","git push and coast","716 Congress"]

# require 'twitter'


# Twitter.configure do |config|
#   config.consumer_key = ENV['CONFIG_CONSUMER_KEY']
#   config.consumer_secret = ENV['CONFIG_CONSUMER_SECRET']
#   config.oauth_token = ENV['CONFIG_OAUTH_TOKEN']
#   config.oauth_token_secret = ENV['CONFIG_OAUTH_TOKEN_SECRET']
# end

  # def play

  # puts "Welcome to Make Your Ipsum. Enter in a twitter hashtag so we can build an ipsum for ya. Your ipsum will be made of tweets from the hashtag you give us!"

  # @@hashtag_request = gets.chomp

  # make_twitter_array

  # runs the Twitter data check method (not yet created) Test answer_twitter through Twitter search to see if it pulls up data- if yes then move on to next prompt if no then prompt user to enter another hashtag

  # puts "Thanks. How many paragraphs do you want?"

  # @@number_of_para = gets.chomp

  # make_block

  # end

  # def make_twitter_array

  # Twitter.search(@@hashtag_request, :count => 10000).results.each do |tweet| #how do we include all tweets without setting a max count
  # twitter_array = tweet.full_text
  # split_string = twitter_array.split(" ")
  # split_string.reject! do |word|
  #   word.include?("#") or word.include?("RT") or word.include?("http") or word.include?("@")
  #     end 
  # joined_string = split_string.join(" ")
  # @@dummyipsum << joined_string
  #   end
  # end


  def self.make_block(number_of_paras)
    @block = number_of_paras.times do make_para
      puts " "
      puts " "
    end
    print @block
  end

  def self.make_para
    @paragraph = 4.times do
      make_sentence
    end
    print @paragraph
  end

  def self.make_sentence
    raw_array = @@dummy_ipsum.sample(5)
    # puts raw_array
    # line above tests to see if I'm actually getting 5 random strings from dummy_ipsum
    last = raw_array.last
    # puts last
    # line above tests to see if I'm pulling the last item in array dummy_ipsum

      if last.include?(".") or last.include?("?") or last.include?("!") or last.include?("...")
      punc_last_array_item = last
      else
      punc_last_array_item = last + "."
      end

    # punc_last_array_item
    # For every 5 phrases (that is for every 5 strings from the dummy_ipsum array) I want to put in a punctuation mark if the last string doesn't already have a punctuation mark. See above. 

    # punc_last_array_item = last + "&&" unless last.include?(".") or last.include?("?") or last.include?("!") or last.include?("...") 
    # This unless syntax was not working with multiple ors!

    raw_array.pop
    # Take the last string off of raw_array

    rev_array = raw_array << punc_last_array_item
    # Push the new punctuated string into raw_array
    # puts rev_array

    raw_sentence = rev_array.join(" ")
    # Taking items out of array to make a string
    # puts raw_sentence

    @cap_sentence = raw_sentence.capitalize

    print @cap_sentence

  end 
end






