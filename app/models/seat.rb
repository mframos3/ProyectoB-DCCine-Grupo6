class Seat < ApplicationRecord
	belongs_to :movie_show
	has_one :user
end
