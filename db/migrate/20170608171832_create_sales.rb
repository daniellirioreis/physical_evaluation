class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.references :student, index: true, foreign_key: true
      t.references :package, index: true, foreign_key: true
      t.boolean :done
      t.float :price
      t.integer :type_sale
      t.integer :discount
      t.integer :installment

      t.timestamps null: false
    end
  end
end
