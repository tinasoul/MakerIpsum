class Ipsum
	attr_accessor :hashtag, :num_of_paragraphs, :name

	def initialize(my_name, my_tag, my_para_count)
		@name = my_name
		@hashtag = my_tag
		@num_of_paragraphs = my_para_count
		@ipsum = []
	end


	def self.configure
		#twitter API call
	end

	def search_for_hash
		# Twitter api call for search
		# returns an array of phrases
	end

	def create_sentence
		# phrases = search_for_hash
		# ...
		# create and return sentence
	end

	def get_paragraph_array
		return @ipsum
	end

	def create_paragraph
		# code for creating paragraph
	end

	def generate_ipsum
		@ipsum = []
		@num_of_paragraphs.times do
			@ipsum << create_paragraph
		end
	end

	def print_ipsum
		if @ipsum.empty?
			generate_ipsum
		end
		puts "I present to you the #{@hashtag} Ipsum"
		@ipsum.each do |paragraph|
			puts paragraph
			puts
		end
	end

	def self.create_ipsum
		puts "What's your name"
		name = gets.chomp
		puts "What's your tag"
		tag = gets.chomp
		puts "..."
		num = gets.to_i
		Ipsum.new(name, tag, num)
	end

	def self.execute
		Ipsum.configure
		continue = true
		while continue
			current_ipsum = self.create_ipsum
			puts "Here's your ipsum"
			current_ipsum.print_ipsum
			puts "Would you like to create another ipsum?"
			continue = gets.chomp.lowercase == 'yes'
		end
	end

	def self.compete
		ipsum1 = self.create_ipsum
		ipsum2 = self.create_ipsum

		puts "Here is the first ipsum. Rate it on a scale of 1 to 10"
		ipsum1.print_ipsum
		puts "What do you rate it?"
		rating = gets.to_i

		puts "Here is the second ipsum. Rate it on a scale of 1 to 10"
		ipsum2.print_ipsum
		puts "What do you rate it?"
		rating2 = gets.to_i

		if rating > rating2
			puts "Player 1 wins"
		else
			puts "Player 2 wins"
		end
			
	end
end

Ipsum.execute