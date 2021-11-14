# frozen_string_literal: true

class Movie < ApplicationRecord
  has_many :movie_shows
  has_one_attached :image
end
