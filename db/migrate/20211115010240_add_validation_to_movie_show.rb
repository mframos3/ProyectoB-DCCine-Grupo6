class AddValidationToMovieShow < ActiveRecord::Migration[6.1]
  def change
    change_column :movie_shows, :room, :integer, null: false, limit: 8
    change_column :movie_shows, :date, :date, null: false
    change_column :movie_shows, :showtime, :integer, default: nil
  end
end
