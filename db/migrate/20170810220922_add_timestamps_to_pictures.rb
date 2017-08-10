class AddTimestampsToPictures < ActiveRecord::Migration[5.1]
  def change
    add_timestamps(:pictures)
  end
end
