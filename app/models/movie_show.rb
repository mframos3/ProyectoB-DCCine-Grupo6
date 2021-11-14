# frozen_string_literal: true

class MovieShow < ApplicationRecord
  belongs_to :movie
  has_many :seats
  enum showtime: %i[matine tanda noche]
end
