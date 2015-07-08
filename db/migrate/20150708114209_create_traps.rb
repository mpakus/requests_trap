class CreateTraps < ActiveRecord::Migration
  def change
    create_table :traps do |t|
      t.string :uri, limit: 255, index: true, unique: true
      t.timestamps null: false
    end
  end
end
