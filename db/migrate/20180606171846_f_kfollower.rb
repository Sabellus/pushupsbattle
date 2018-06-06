class FKfollower < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :followers, :users, column: :follower_id
    add_foreign_key :followers, :users, column: :followed_id
    add_index :followers, :follower_id
    add_index :followers, :followed_id
  end
end
