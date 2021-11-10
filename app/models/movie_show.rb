class MovieShow < ApplicationRecord
  belongs_to :movie
  has_many :seats
  enum showtime: [:matine, :tanda, :noche]
end
