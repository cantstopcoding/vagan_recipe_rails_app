class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments
  has_many :commented_users, through: :comments, source: :user
end
