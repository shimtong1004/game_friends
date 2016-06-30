class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :uniq_key
      t.timestamps null: false
    end
    add_index :users, :uniq_key
  end
end
