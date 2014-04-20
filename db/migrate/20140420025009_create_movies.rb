class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :url, :null => false
      t.string :iframe, :null => false
      t.string :image_url
      t.string :supplier
      t.integer :video_id

      t.timestamps
    end
    add_index :movies, :video_id
    add_index :movies, :url
  end
end
