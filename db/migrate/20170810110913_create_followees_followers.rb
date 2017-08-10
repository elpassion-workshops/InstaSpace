class CreateFolloweesFollowers < ActiveRecord::Migration[5.0]
  def up
    create_table 'followees_followers', :id => false do |t|
        t.column :followee_id, :integer, null: false, unique: true
        t.column :follower_id, :integer, null: false, unique: true
    end
  end

  def down
    drop_table 'followees_followers'
  end
end
