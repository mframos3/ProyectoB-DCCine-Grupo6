class CreateMovieShows < ActiveRecord::Migration[6.1]
  def change
    create_table :movie_shows do |t|
      t.integer :room
      t.integer :showtime
      t.date :date
      t.belongs_to :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
