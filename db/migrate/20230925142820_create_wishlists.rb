class CreateWishlists < ActiveRecord::Migration[7.0]
  def change
    create_table :wishlists do |t|
      t.string :name
      t.text :description
      t.string :picture

      t.timestamps
    end
  end
end
