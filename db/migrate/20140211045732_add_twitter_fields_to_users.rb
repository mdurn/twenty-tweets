class AddTwitterFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :image, :string
    add_column :users, :twitter_nickname, :string
    add_column :users, :twitter_uri, :string
    add_column :users, :twitter_token, :string
    add_column :users, :twitter_secret, :string
  end
end
