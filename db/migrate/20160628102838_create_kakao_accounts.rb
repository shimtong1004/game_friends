class CreateKakaoAccounts < ActiveRecord::Migration
  def change
    create_table :kakao_accounts do |t|
      t.integer :game_id
      t.string  :account
      t.timestamps null: false
    end
    add_index :kakao_accounts, :game_id
  end
end
