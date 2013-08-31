require 'faker'


10.times do 
	Post.create(:title => Faker::Lorem.word, :body => Faker::Lorem.sentence)
end

15.times do 
 	Tag.create(:name => Faker::Lorem.word)
end


# This is not working could not find why and had to do it through the console

20.times do 
 	Relation.create(:post_id=>rand(1..10),:tag_id =>rand(1..15))
end