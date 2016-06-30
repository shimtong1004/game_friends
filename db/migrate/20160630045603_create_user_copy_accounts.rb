class CreateUserCopyAccounts < ActiveRecord::Migration
  def change
    create_table :user_copy_accounts do |t|
      t.integer :user_id
      t.integer :account_id
      t.timestamps null: false
    end
    add_index :user_copy_accounts, :user_id
    add_index :user_copy_accounts, [:user_id, :account_id]
  end
end
