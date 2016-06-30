class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :game_uniq_key
      t.timestamps null: false
    end
    add_index :users, :game_uniq_key
  end
end
