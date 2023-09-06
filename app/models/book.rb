class Book < ApplicationRecord
  belongs_to :author
  validates :title, :author_id, :date_release, presence: :true
end
