class CreateExerciseDones < ActiveRecord::Migration
  def change
    create_table :exercise_dones do |t|
      t.references :exercise_training, index: true, foreign_key: true
      t.date :date
      t.boolean :done

      t.timestamps null: false
    end
  end
end
