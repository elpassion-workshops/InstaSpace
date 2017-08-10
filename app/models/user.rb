class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :followers, uniq: true, class_name: "User", foreign_key: "followee_id", join_table: "followees_followers", association_foreign_key: "follower_id"
  has_and_belongs_to_many :followees, uniq: true, class_name: "User", foreign_key: "follower_id", join_table: "followees_followers", association_foreign_key: "followee_id"


  def follow user
    followees << user unless followees.include?(user)
  end

  def unfollow user
    followees.delete(user)
  end

  def following? user
    followees.include? user
  end
end
