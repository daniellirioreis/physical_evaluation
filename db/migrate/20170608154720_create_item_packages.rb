class CreateItemPackages < ActiveRecord::Migration
  def change
    create_table :item_packages do |t|
      t.references :product, index: true, foreign_key: true
      t.references :package, index: true, foreign_key: true
      t.float :price

      t.timestamps null: false
    end
  end
end
