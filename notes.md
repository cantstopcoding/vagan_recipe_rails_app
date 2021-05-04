User
first_name
last_name
username
bio
email
password_digest

has_many :comments
has_many :recipes
has_many :commented_recipes, through comments
has_many :categories, through: :recipes

Recipe:
title
image_url
ingredients
instructions

belongs_to: users
has_many :comments
has_many :users, through comments
belong_to :category

Comment
content

belongs_to: :comments
belongs_to: recipes

Category
name
has_many :recipes
belongs_to :users, through: :recipes

### Things to Address
