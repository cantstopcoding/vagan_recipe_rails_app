class User < ApplicationRecord
  has_many :comments
  has_many :recipes
  has_many :commented_recipes, through: :comments, source: :recipe
  has_secure_password

  validates :first_name, :last_name, :username, :email, presence: true
end
