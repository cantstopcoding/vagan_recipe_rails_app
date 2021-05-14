class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments
  has_many :commented_users, through: :comments, source: :user
  validates :title, :image_url, :ingredients, :instructions, :category_id, presence: true

  scope :alpha, -> { order(:title) }
  scope :most_commented, -> { left_joins(:comments).group("recipes.id").order("count(recipes.id) desc") }

  # def category_attributes(attr)
  #   self.category = Category.find_or_create_by(attr) if !attr[:name].blank?
  # end
end
