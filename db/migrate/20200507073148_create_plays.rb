class CreatePlays < ActiveRecord::Migration[6.0]
  def change
    create_table :plays do |t|
      t.string :timer_val, null: false
      t.text   :image_url, null: false

      t.timestamps
    end
  end
end
