class RemoveUnusedDeviseColumnsFromUsers < ActiveRecord::Migration
  def change
    remove_index :users, :reset_password_token
    remove_index :users, :email

    remove_column :users, :reset_password_token, :string
    remove_column :users, :reset_password_sent_at, :string
  end
end
