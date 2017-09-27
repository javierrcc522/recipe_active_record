require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

#Index Routes, dont change
get('/') do
  @recipes = Recipe.all()
  @categories = Category.all()
  erb(:index)
end

get('/create_recipe') do
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
  erb(:index)
end

get('/create_category') do
  @categories = Category.all()
  @recipes = Recipe.all()
  erb(:index)
end

post('/create_category') do
  tag = params['tag']
  category = Category.create({:tag => tag})
  @categories = Category.all().sort_by {|category| category.tag}
  @recipes = Recipe.all()
  erb(:index)
end
#End Index Routes

get('/recipe/:id') do
  @recipe = Recipe.find(params[:id])
  erb(:recipe_info)
end

# post('/add_ingredient/:id') do
#   ing_name = params['ingredient']
#   Ingredient.new({:ingredient => ing_name, :ingredient_id => [@recipe.id]})
#   erb(:recipe_info)
# end
