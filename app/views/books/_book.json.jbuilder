json.extract! book, :id, :title, :publication_date, :author_id, :pages, :genre_id, :created_at, :updated_at
json.url book_url(book, format: :json)
