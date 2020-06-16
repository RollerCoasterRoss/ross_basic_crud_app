class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :rating
      t.text :synopsis

      t.timestamps
    end
  end
end
