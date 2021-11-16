# frozen_string_literal: true

class MovieShow < ApplicationRecord
  belongs_to :movie
  has_many :seats
  enum showtime: %i[matine tanda noche]
  validates_presence_of :room, message: 'Sala debe estar presente'
  validates_presence_of :showtime, message: 'Horario debe estar presente'
  validates_presence_of :date, message: 'Fecha debe estar presente'
  validate :valid_date?

  def valid_date?
    errors.add(:date, 'La fecha no es válida') if date.present? && (date < Date.current)
  end
end
