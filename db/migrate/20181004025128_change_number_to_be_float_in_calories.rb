class ChangeNumberToBeFloatInCalories < ActiveRecord::Migration[5.2]
  def change
    change_column :calories, :number, :float
  end
end
