json.extract! book, :id, :title, :author_id, :date_release, :created_at, :updated_at
json.url book_url(book, format: :json)
