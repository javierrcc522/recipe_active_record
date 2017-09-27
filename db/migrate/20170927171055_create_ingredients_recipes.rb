class CreateIngredientsRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table(:ingredients_recipes) do |t|
      t.column(:ingredient_id, :integer)
      t.column(:recipe_id, :integer)

    end
  end
end
