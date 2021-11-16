# frozen_string_literal: true

FactoryBot.define do
  factory :movie_show do
    room { 1 }
    showtime { :matine }
    date { Date.today }
  end
end
