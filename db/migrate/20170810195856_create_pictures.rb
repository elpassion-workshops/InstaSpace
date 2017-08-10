class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.attachment :file
      t.text :description
      t.references :user, foreign_key: true
    end
  end
end
