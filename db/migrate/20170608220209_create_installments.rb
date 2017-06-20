class CreateInstallments < ActiveRecord::Migration
  def change
    create_table :installments do |t|
      t.references :sale, index: true, foreign_key: true
      t.float :price
      t.boolean :done

      t.timestamps null: false
    end
  end
end
