# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

class Seed 
    def self.begin
        seed = Seed.new
        seed.generate_books
    end

    def generate_books
        5.times do |i|
            book = Book.create!(
                author:Faker::Name.name,
                title:Faker::Movie.title,
                synposis:Faker::Lorem.paragraph(sentence_count: 4)
            )
        end
    end
end

Seed.begin