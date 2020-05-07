class CreateImageUploads < ActiveRecord::Migration[6.0]
  def change
    create_table :image_uploads do |t|

      t.timestamps
    end
  end
end
