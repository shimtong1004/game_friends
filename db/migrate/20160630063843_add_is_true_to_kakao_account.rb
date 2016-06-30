class AddIsTrueToKakaoAccount < ActiveRecord::Migration
  def change
    add_column :kakao_accounts, :is_true, :boolean, default: true
    add_index :kakao_accounts, [:game_id, :is_true]
  end
  
end
