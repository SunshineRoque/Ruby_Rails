# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do |i|
  Post.create(title: "numbered post #{i}", content: "numbered post content #{i}", published: "true")
end

10.times do |i|
  Feedback.create(name: "Shira chen #{i}", email: "rubyrails@gmail.com #{i}", subjetc: "Mathematcis #{i}", message: "Hello guys, how are you. Me you  too #{i}")
end