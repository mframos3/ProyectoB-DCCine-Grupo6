# frozen_string_literal: true

FactoryBot.define do
  factory :movie_show do
    room { 1 }
    showtime { :matine }
    date { Date.today }
    seats {
      build_list(:seat, 1) do |seat, i|
        seat.row = 1
        seat.col = 1
      end
    }
  end
end