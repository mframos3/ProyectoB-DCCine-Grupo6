# frozen_string_literal: true

class CreateSeats < ActiveRecord::Migration[6.1]
  def change
    create_table :seats do |t|
      t.integer :row
      t.integer :col
      t.belongs_to :movie_show, null: false, foreign_key: true
      t.integer :user_id
      t.timestamps
    end
  end
end
