# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require 'json'
require 'open-uri'

url = "https://tmdb.lewagon.com/movie/top_rated"
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)["results"]


movies.each do |movie|
  title = movie['original_title']
  overview = movie['overview']
  poster_url = movie['poster_path']
  rating = movie['vote_average']
  attributes = { title: title, overview: overview, poster_url: poster_url, rating: rating }
  Movie.create!(attributes)
  puts "created #{title} in movie database"
end

puts 'finished!'
