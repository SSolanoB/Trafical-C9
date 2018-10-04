class AddNumberOfRegistersToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :number_of_registers, :int
  end
end
