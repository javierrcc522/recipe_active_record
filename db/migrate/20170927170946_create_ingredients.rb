class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table(:ingredients) do |t|
      t.column(:ingredient, :string)

    end
  end
end
