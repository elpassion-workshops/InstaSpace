class User < ApplicationRecord
  has_many :pictures
  has_many :comments

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
end
