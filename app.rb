require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

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
