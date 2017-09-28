require("bundler/setup")
require 'pry'
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

#Index Routes (dont change!)
get('/') do
  @recipes = Recipe.all()
  @categories = Category.all()
  @ingredients = Ingredient.all()
  erb(:index)
end

get('/create_recipe') do
  @ingredients = Ingredient.all()
  @recipes = Recipe.all()
  @categories = Category.all()
  erb(:index)
end

post('/create_recipe') do
  name = params['name']
  rating = params['rating']
  recipe = Recipe.create({:name => name, :rating => rating})
  @recipes = Recipe.all().sort_by {|recipe| recipe.rating}
  @categories = Category.all()
  @ingredients = Ingredient.all()
  erb(:index)
end

get('/create_category') do
  @ingredients = Ingredient.all()
  @categories = Category.all()
  @recipes = Recipe.all()
  erb(:index)
end

post('/create_category') do
  tag = params['tag']
  category = Category.create({:tag => tag})
  @categories = Category.all().sort_by {|category| category.tag}
  @recipes = Recipe.all()
  @ingredients = Ingredient.all()
  erb(:index)
end

get('/add_ingredient') do
  @ingredients = Ingredient.all()
  @categories = Category.all()
  @recipes = Recipe.all()
  erb(:index)
end

post('/add_ingredient') do
  ingredient = params['ingredient']
  ingredient = Ingredient.create({:ingredient => ingredient})
  @ingredients = Ingredient.all().sort_by {|ingredient| ingredient.ingredient}
  @recipes = Recipe.all()
  @categories = Category.all()
  erb(:index)
end
#End Index Routes

#Start Info Routes

#Recipe Info (dont change!)
get('/recipe/:id') do
  @recipe = Recipe.find(params[:id])
  @ingredients = Ingredient.all
  @categories = Category.all()
  # Returns the ARRAY where the the elements of ALL ingredients are not that of the elements of a RECIPE'S INGREDIENTS
  @unused_ingredients = @ingredients - @recipe.ingredients
  @unused_categories = @categories - @recipe.categories
  erb(:recipe_info)
end

post('/add_ing/:id') do
  recipe = Recipe.find(params[:id])
  ingredients = Ingredient.all
  ingredient_ids = params['ingredient_ids']
  ingredient_ids.each do |ingredient_id|
    recipe.ingredients.push(Ingredient.find(ingredient_id))
  end
  redirect "/recipe/#{recipe.id}"
end

post('/add_cat/:id') do
  recipe = Recipe.find(params[:id])
  categories = Category.all
  category_ids = params['category_ids']
  category_ids.each do |category_id|
    recipe.categories.push(Category.find(category_id))
  end
  redirect "/recipe/#{recipe.id}"
end
#End Recipe Info

get('/category/:id') do
  @category = Category.find(params[:id])
  erb(:category_info)
end

get('/ingredient/:id') do
  @ingredient = Ingredient.find(params[:id])
  erb(:ingredient_info)
end
