class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates_uniqueness_of :username
  validates :username, presence: :true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
