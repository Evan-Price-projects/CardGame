class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.string 'tablename'
      t.timestamps
      t.references 'card'
      t.references 'user'
    end
  end
end
