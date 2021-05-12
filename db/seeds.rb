# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

caroline = User.create({ first_name: "Caroline", last_name: "D'ambrosio", username: "bestdesigner", email: "caroline@caroline.com", password: "pw" })
coco = User.create({ first_name: "Coco", last_name: "Chanel", username: "chanel", email: "chanel@chanel.com", password: "pw" })
christian = User.create({ first_name: "Christian", last_name: "Dior", username: "dior", email: "dior@dior.com", password: "pw" })

# mediterranean = Category.create({ name: "Mediterranean" })
# gluten_free = Category.create({ name: "Gluten Free" })
# dessert = Category.create({ name: "Dessert" })

eggplant_recipe = Recipe.create({
  title: "Greek-Style Eggplant Recipe",
  ingredients: "1.5 lb eggplant, cut into cubes,
    Kosher salt,
    Extra Virgin Olive Oil (I used Private Reserve Greek EVOO),
    1 large yellow onion, chopped,
    1 green bell pepper, stem and innards removed, diced,
    1 carrot, chopped",
  instructions: "Place eggplant cubes in a colander over a large bowl or directly over your sink, and sprinkle with salt. Set aside for 20 minutes or so to allow eggplant to sweat out any bitterness. Rinse with water and pat dry.",
  image_url: "https://www.themediterraneandish.com/wp-content/uploads/2020/03/braised-eggplant-recipe-greek-style-6.jpg",
  user_id: caroline.id,
})

gluten_free_cookie = Recipe.create({
  title: "Gluten Free Cookie",
  ingredients: "1 stick butter, ½ cup,
    1 tablespoon milk, or almond milk,
    ¾ cup brown sugar,
    ¼ cup white sugar,
    1 egg",
  instructions: "Bake it",
  image_url: "https://meaningfuleats.com/wp-content/uploads/2018/06/IMG_1244.jpg",
  user_id: coco.id,
})

chocolate_cake = Recipe.create({
  title: "Chocolate Cake",
  ingredients: "1 cup unsweetened almond milk,
    1 tablespoon apple cider vinegar
    2 cups all purpose flour
    1 3/4 cups granulated sugar",
  instructions: "Bake it",
  image_url: "https://www.themediterraneandish.com/wp-content/uploads/2020/03/braised-eggplant-recipe-greek-style-6.jpg",
  user_id: christian.id,
})

comment_1 = Comment.create({
  content: "It's so good!",
  user_id: coco.id,
  recipe_id: eggplant_recipe.id,
})

comment_2 = Comment.create({
  content: "My favorite!",
  user_id: christian.id,
  recipe_id: gluten_free_cookie.id,
})

comment_3 = Comment.create({
  content: "I'm going to eat it!",
  user_id: caroline.id,
  recipe_id: chocolate_cake.id,
})
