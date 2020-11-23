class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.string :title
      t.integer :movie_id
      t.integer :thumbs_up, :default => 0
      t.integer :thumbs_down, :default => 0

      t.timestamps
    end
  end
end
