# frozen_string_literal: true

class MovieShow < ApplicationRecord
  belongs_to :movie
  has_many :seats
  enum showtime: %i[matine tanda noche]
  validates_presence_of :room, message: 'Sala debe estar presente'
  validates_presence_of :showtime, message: 'Horario debe estar presente'
  validates_presence_of :date, message: 'Fecha debe estar presente'
  validate :valid_date?
  validate :valid_showtime?

  def valid_date?
    errors.add(:date, 'La fecha no es válida') if date.present? && (date < Date.current)
  end

  def valid_showtime?
    same_movie_show = MovieShow.where(date: date, room: room, showtime: showtime)
    if same_movie_show.length > 0
      errors.add(:time, 'La sala está ocupada en la fecha y horario escogido')
    end
  end
end
