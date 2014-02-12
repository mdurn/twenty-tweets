class CreateTwitterSearchQueries < ActiveRecord::Migration
  def change
    create_table :twitter_search_queries do |t|
      t.integer :user_id
      t.string :query

      t.timestamps
    end
  end
end
