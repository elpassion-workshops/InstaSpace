class User < ApplicationRecord
  has_attached_file :avatar, default_url: 'http://piesnloduiognia.pl/wp-content/uploads/2016/02/Jon_Snow.jpg'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_many :pictures
  has_many :comments

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
end
