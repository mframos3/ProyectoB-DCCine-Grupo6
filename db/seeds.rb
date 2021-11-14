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
movies.second.image.attach(io: File.open('app/assets/images/tloftr.jpg'), filename: 'tloftr.jpg')
movie_shows = MovieShow.create([{
                   room: 1,
                   showtime: 0,
                   date: Date.new(2021, 11, 11),
                   movie: movies.first
                 },
                 {
                  room: 1,
                  showtime: 0,
                  date: Date.today,
                  movie: movies.first
                },
                {
                  room: 2,
                  showtime: 0,
                  date: Date.new(2021, 11, 11),
                  movie: movies.second
                }])
users = User.create([{
              name: 'Erick',
              rut: '19947832-K'
            }])
Seat.create([{
              row: 0,
              col: 0,
              user_id: users.first.id,
              movie_show: movie_shows.first
            },
             {
               row: 1,
               col: 1,
               movie_show: movie_shows.first
             }])
