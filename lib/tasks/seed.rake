require "faker"
namespace :db do 
	task seed_custom: :environment do 
		puts "Seeding database"

		I18n.locale = :en
		Faker::Config.locale = :en


		# Countries
		countries = Array.new(20) {Faker::Address.country}
		countries = countries.uniq
		countries.each do |country|
		  Country.create(
		    name: country
		  )
		end
	  country_ids = Country.pluck(:id)

		# Genres
		genres = Array.new(20) {Faker::Book.genre}
		genres = genres.uniq
		genres.each do |genre|
		  Genre.create(
		    name: Faker::Book.genre
		  )
		end
		genre_ids = Genre.pluck(:id)

		# Authors
		20.times do
		  Author.create(
        name: Faker::Book.author,
        country_id: country_ids.sample,
        birth_date: Faker::Date.birthday
      )
		end
		author_ids = Author.pluck(:id)

		# Publishers
		20.times do
		  Publisher.create(
        name: Faker::Book.publisher,
        country_id: country_ids.sample
      )
		end

		# Books
		40.times do
		  Book.create(
		    title: Faker::Book.title,
		    publication_date: Faker::Date.backward,
		    author_id: author_ids.sample,
		    pages: rand(20..1000),
		    genre_id: genre_ids.sample,
      )
		end
	end
end
