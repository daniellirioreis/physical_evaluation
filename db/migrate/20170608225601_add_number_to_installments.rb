class AddNumberToInstallments < ActiveRecord::Migration
  def change
    add_column :installments, :number, :integer
  end
end
