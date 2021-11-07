class MovieShow < ApplicationRecord
  belongs_to :movie
  has_many :seats
end
