class CreateCalories < ActiveRecord::Migration[5.2]
  def change
    create_table :calories do |t|
      t.references :user, foreign_key: true
      t.integer :number
      t.boolean :type_gained
      t.text :activity
      t.datetime :date

      t.timestamps
    end
    add_index :calories, [:user_id, :date]
  end
end
