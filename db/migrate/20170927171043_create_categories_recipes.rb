class CreateCategoriesRecipes < ActiveRecord::Migration[5.1]
  def change
    #order alphabetically
    create_table(:categories_recipes) do |t|
      t.column(:category_id, :integer)
      t.column(:recipe_id, :integer)

    end
  end
end
