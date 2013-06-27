# ipsum = ["that's so bootstrap", "HAHA business", "alright alright", "I don't speak frat", "dogs drink superwater", "D-Money", "ruby redbird", "chi'lantro", "git push and coast"]

# india = ["limbu paani", "pav baji", "Amitabh Bachchan", "bollywood", "shah", "patel", "parekh", "dot on your forehead", "elephant", "monkey", "rickshaw", "brown people spicy?", "bhangra","curry", "mangoooooo", "Snapshot India", "slumdog app developer", "thank you come again", "hotel/motel", "aunty"]

class Ipsum
  # class info
  @@dummy_ipsum = ["that's so bootstrap.", "HAHA business.", "alright alright.", "I don't speak frat.", "dogs drink superwater.", "D-Money.", "ruby redbird.", "chi'lantro.", "git push and coast."]
  @@final_sentence


  def self.make_a_paragraph(number_of_paras)
    number_of_paras.times do
      5.times do 
        make_a_sentence
      end
      puts " "
      puts " "
    end
  end

  def self.make_a_sentence
    raw_sentence = @@dummy_ipsum.sample(5).join(" ")
    capitalized_sentence = raw_sentence.capitalize!


    punctuated_sentence = "#{capitalized_sentence}#{%w{. ? !}[rand(0..2)]}"
    @@final_sentence = punctuated_sentence + " "

    
    final_sentence_array = []
    final_sentence_array << @@final_sentence
    print final_sentence_array
  end
end



#   # has paragraphs
#   def paragraphs(n)
#     # generate n paragraphs
#     paragraphs = Array.new(n) { |index|
#       Paragraph.new.sentences( rand(15..20) )
#     }
#   end

# end

# class Paragraph
#   # class info

#   # instance info
#   # has sentences
#   def sentences(n)
#     # generate n sentences
#     sentences = Array.new(n) { |index|
#       Sentence.new.words( rand(10..15) )
#     }
#     sentences.join(' ')
#   end

# end

# class Sentence
#   # class info

#   # instance info
#   # has words

#   def words(n)
#     # generate n sentences
#     words = Array.new(n) { |index|
#       Word.new
#     }
#     words[0].capitalize!               # capitalize first word
#     words[-1] += %w{. ? !}[rand(0..2)] # add ending punctuation
#     2.times {
#       # add middle punctuation
#       words[rand(0..words.count-2)] += %w{, ; : \ - ...}[rand(0..4)]
#     }
#     words
#   end
# end

# class Word
#   # class info

#   def self.new
#     Ipsum.dictionary[ rand( 0..Ipsum.dictionary.count-1 ) ]
#   end

#   # instance info
# end


# # --------- Main ---------- #

# # Ipsum.new.paragraphs(n) => array of n paragraphs
# paragraphs = Ipsum.new.paragraphs(2)

# # render to console
# paragraphs.each { |p| puts p; puts }

# # to render in rails, iterate over array of paragraphs
# # <% Ipsum.new.paragraphs(2).each do |p| %>
# #   <p><%= p %></p>
# # <% end %>

# # --------- Test ---------- #
# # Ipsum.new