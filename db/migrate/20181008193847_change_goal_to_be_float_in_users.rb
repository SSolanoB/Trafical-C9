class ChangeGoalToBeFloatInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :goal, :float, :null => false, :default => 0
  end
end
