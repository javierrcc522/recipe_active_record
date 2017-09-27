require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @recipes = Recipe.all()
  erb(:index)
end

get('/create_recipe') do
  @recipes = Recipe.all()
  erb(:index)
end

post('/create_recipe') do
  name = params['name']
  rating = params['rating']
  recipe = Recipe.create({:name => name, :rating => rating})
  @recipes = Recipe.all()
  erb(:index)
end
