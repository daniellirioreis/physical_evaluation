class AddProtocolToEvaluations < ActiveRecord::Migration
  def change
    add_column :evaluations, :protocol, :integer
  end
end
