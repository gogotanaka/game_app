class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title, :null => false
      t.integer :view, default: 0
      t.string :contents
      t.string :image_url
      t.boolean :linkrot, default: false

      t.timestamps
    end
    add_index :videos, :title
  end
end
