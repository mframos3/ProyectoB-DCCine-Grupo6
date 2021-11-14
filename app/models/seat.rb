# frozen_string_literal: true

class Seat < ApplicationRecord
  belongs_to :movie_show
end
