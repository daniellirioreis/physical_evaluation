class AddEvaluationPreviousIdToEvaluations < ActiveRecord::Migration
  def change
    add_column :evaluations, :evaluation_previous_id, :integer
  end
end
