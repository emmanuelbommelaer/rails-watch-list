# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
require "json"

puts "loading movies from LW proxy"
url = "https://tmdb.lewagon.com/movie/top_rated"
data = JSON.load(URI.open(url))["results"]

if data
  puts "movies loaded"
end

data.each do |movie|
  Movie.create(title: movie["original_title"],
               overview: movie["overview"],
               poster_url: "https://image.tmdb.org/t/p/w500#{movie["poster_path"]}",
               rating: movie["vote_average"])
end
