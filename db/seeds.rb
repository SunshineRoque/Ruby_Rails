# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Category.create!(name: "Tornado")

Category.create!(name: "Landslide")

Category.create!(name: "Typhoon")

3.times do |i|
  name = Faker::Name.name
  User.create!(
    name: name,
    phone_number: Faker::PhoneNumber,
    email: "#{name.downcase.split.join('.')}@gmail.com",
    password: 'password123'
  )
end

50.times do |i|
  post = Post.new
  post.user = User.all.sample
  post.title = Faker::Lorem.sentence
  post.content = Faker::Lorem.paragraph(sentence_count: 4)
  post.published = true
  post.categories << Category.all.sample
  post.save

  10.times do
    post.comments.create(content: Faker::Lorem.paragraph(sentence_count: 4))
    Comment.create(post: post, content: Faker::Lorem.paragraph(sentence_count: 4))
  end
end

# 50.times do |i|
#   post = Feedback.new
#   post.name = Faker::Lorem.sentence
#   post.email = "#{Faker::Name.first_name.downcase}.#{Faker::Name.last_name.downcase}@gmail.com"
#   post.subjetc = Faker::Lorem.sentence
#   post.message = Faker::Lorem.paragraph(sentence_count: 4)
#   post.remarks = "Unmarked"
#   post.save
#
#   10.times do
#     post.notes.create(content: Faker::Lorem.paragraph(sentence_count: 4))
#     Note.create(feedback: post, content: Faker::Lorem.paragraph(sentence_count: 4))
#   end
# end

