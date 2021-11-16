# frozen_string_literal: true

FactoryBot.define do
  factory :movie do
    trait :tlotr do
      title { 'El señor de los anillos' }
      after(:build) do |movie|
        movie.image.attach(io: File.open('app/assets/images/tloftr.jpg'), filename: 'tlotr.jpg',
                           content_type: 'image/jpg')
      end
    end
    trait :star_wars do
      title { 'Star Wars' }
      after(:build) do |movie|
        movie.image.attach(io: File.open('app/assets/images/star_wars.jpg'), filename: 'star_wars.jpg',
                           content_type: 'image/jpg')
      end
    end
  end
end
