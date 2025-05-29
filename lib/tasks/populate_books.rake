require "faker"
namespace :db do 
	task populate_books: :environment do 
		puts "Populating Books Table"

		I18n.locale = :en
		Faker::Config.locale = :en

		author_ids = Author.pluck(:id)
		genre_ids = Genre.pluck(:id)

		# Books
		40.times do |i|
		  Book.create(
		    title: Faker::Book.title,
		    publication_date: Faker::Date.backward,
		    author_id: author_ids.sample,
		    pages: rand(20..1000),
		    genre_id: genre_ids.sample
      )
		end
	end
end
