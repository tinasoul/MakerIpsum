ipsum = ["that's so bootstrap", "HAHA business", "alright alright", "I don't speak frat", "dogs drink superwater", "devhouse party", "D-Money", "ruby redbird", "git push origin master", "git push and coast"]

puts "How many paragraphs do you want?"

answer = gets.chomp.to_i

answer.times {5.times {ipsum.sample(5).each do |thing|
	print "#{thing} "
end} }




# How many paragraphs do you want?
# # 	gets answer
# i.e. # if 3 then run above loop 3 times

# sentence = ipsum.sample(5).join(" ")
# puts sentence
# 5.times {print sentence} ----> prints the SAME sentence in a row 5 times
