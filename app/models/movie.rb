class Movie < ApplicationRecord
	has_many :movie_shows
	has_one_attached :image
	validates_presence_of :title, :message => "Nombre debe estar presente"
	validates_presence_of :image, :message => "Imagen debe estar presente"
end
