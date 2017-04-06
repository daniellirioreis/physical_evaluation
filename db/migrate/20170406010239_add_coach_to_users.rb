class AddCoachToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :coach, index: true, foreign_key: true
  end
end
