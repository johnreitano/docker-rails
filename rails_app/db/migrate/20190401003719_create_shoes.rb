class CreateShoes < ActiveRecord::Migration[5.2]
  def change
    create_table :shoes do |t|
      t.integer :size
      t.string :name

      t.timestamps
    end
  end
end
