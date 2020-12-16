class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name
      t.string :location
      t.integer :status
      t.string :cardFront
      t.string :tablename
      t.timestamps
    end
  end
end