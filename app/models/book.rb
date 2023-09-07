class Book < ApplicationRecord
  belongs_to :author
  validates :title, :author_id, :date_release, presence: :true
  validates :title, length: { minimum:1 }
end
