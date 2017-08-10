class Picture < ApplicationRecord
  has_attached_file :file
  validates_presence_of :file, :description
  validates_attachment_content_type :file,
                                    :content_type => %w(image/jpg image/jpeg image/png image/gif)

  belongs_to :user
  has_many :comments
end
