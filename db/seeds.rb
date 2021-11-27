# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
movies = Movie.create([{ title: 'Star Wars' }, { title: 'Lord of the Rings' }])
movies.first.image.attach(io: File.open('app/assets/images/star_wars.jpg'), filename: 'star_wars.jpg')
movies.first.save!
movies.second.image.attach(io: File.open('app/assets/images/tloftr.jpg'), filename: 'tloftr.jpg')
movie_shows = MovieShow.create([{
                                 room: 1,
                                 showtime: 0,
                                 date: Date.tomorrow,
                                 movie: movies.second
                               },
                                {
                                  room: 3,
                                  showtime: 0,
                                  date: Date.today,
                                  movie: movies.second
                                },
                                {
                                  room: 2,
                                  showtime: 0,
                                  date: Date.new(2022,01,02),
                                  movie: movies.second
                                }])
user = User.create({
                      name: 'Erick',
                      rut: '19947832-K'
                    })

ocupated = [[0,3], [3,5], [2,7], [2,10], [1,7]]

movie_shows.each do |movie_show|
  (0..3).each do |row|
    (0..11).each do |col|
      movie_show.seats.create!({ row: row, col: col, user_id: ocupated.include?([row, col])? user.id : nil })
    end
  end
end
