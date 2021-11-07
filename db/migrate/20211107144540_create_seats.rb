class CreateSeats < ActiveRecord::Migration[6.1]
  def change
    create_table :seats do |t|
      t.integer :row
      t.integer :col
      t.belongs_to :movie_show, null: false, foreign_key: true
      t.belongs_to :user, null: true, foreign_key: true
      t.timestamps
    end
  end
end
