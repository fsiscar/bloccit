# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'random_data'

# 50.times do
#   Post.create!(
#     title: RandomData.random_sentence,
#     body: RandomData.random_paragraph
#   )
# end

#Create post with unique title and body
post = Post.find_or_create_by!(
  title: "This is a unique title",
  body: "This is a unique body for unique post."
)

# posts = Post.all
#
# #Create Comments
# 100.times do
#   Comment.create!(
#     post: posts.sample,
#     body: RandomData.random_paragraph
#   )
# end

#Comment.create_with(Post.title: "This is a unique title").find_or_create_by!(body: "And this is a unique comment.")
post.comments.find_or_create_by!(body: "And this is a unique comment.")

# #Create Advertisements
# 20.times do
#   Advertisement.create!(
#     title: RandomData.random_sentence,
#     copy: RandomData.random_paragraph,
#     price: rand(1..99)
#   )
# end

#Create Questions
# 20.times do
#   Question.create!(
#     title: RandomData.random_sentence,
#     body: RandomData.random_paragraph,
#     resolved: [true, false].sample
#   )
# end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisements created"
puts "#{Question.count} questions created"
