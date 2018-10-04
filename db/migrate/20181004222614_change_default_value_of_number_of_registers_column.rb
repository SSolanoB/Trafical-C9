class ChangeDefaultValueOfNumberOfRegistersColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :number_of_registers, :int, default: 0
  end
end
