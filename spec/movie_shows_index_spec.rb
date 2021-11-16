# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Movies Visualization', type: :system do
  it 'new_movie' do
    movie = create(:movie, :tlotr)
    create(:movie, :star_wars)
    create(:movie_show, movie: movie)

    visit '/movies'
    movie_count = page.all('div.movies').size
    visit '/movie_shows/new'
    select 'Star Wars', from: 'movie_show_movie_id'
    fill_in 'movie_show_room', with: 1
    select 'Matine', from: 'movie_show_showtime'
    fill_in 'movie_show_date', with: Date.today.strftime('%m/%d/%Y')
    click_button 'Create Movie show'
    visit '/movies'
    star_wars_card = page.all('div.movie-card').last
    expect(star_wars_card).to have_content('Star Wars')
    expect(star_wars_card).to have_content("MATINÉ:\nSala 1")
    expect(page).to have_selector('div.movie-card', count: movie_count + 1)
  end

  it 'old_movie in same schedule' do
    movie = create(:movie, :star_wars)
    create(:movie_show, movie: movie)
    visit '/movies'
    star_wars_card = page.find('div.movie-card')
    expect(star_wars_card).to have_content('Star Wars')
    expect(star_wars_card).to have_content("MATINÉ:\nSala 1")
    expect(star_wars_card).not_to have_content("MATINÉ:\nSala 2 Sala1")
    visit '/movie_shows/new'
    select 'Star Wars', from: 'movie_show_movie_id'
    fill_in 'movie_show_room', with: 2
    select 'Matine', from: 'movie_show_showtime'
    fill_in 'movie_show_date', with: Date.today.strftime('%m/%d/%Y')
    click_button 'Create Movie show'
    visit '/movies'
    star_wars_card = page.find('div.movie-card')
    expect(star_wars_card).to have_content("MATINÉ:\nSala 2 Sala 1")
  end

  it 'old_movie in new schedule' do
    movie = create(:movie, :star_wars)
    create(:movie_show, movie: movie)
    visit '/movies'
    star_wars_card = page.find('div.movie-card')
    expect(star_wars_card).to have_content('Star Wars')
    expect(star_wars_card).to have_content("MATINÉ:\nSala 1")
    expect(star_wars_card).not_to have_content("TANDA:\nSala 2")
    visit '/movie_shows/new'
    select 'Star Wars', from: 'movie_show_movie_id'
    fill_in 'movie_show_room', with: 2
    select 'Tanda', from: 'movie_show_showtime'
    fill_in 'movie_show_date', with: Date.today.strftime('%m/%d/%Y')
    click_button 'Create Movie show'
    visit '/movies'
    star_wars_card = page.find('div.movie-card')
    expect(star_wars_card).to have_content("MATINÉ:\nSala 1")
    expect(star_wars_card).to have_content("TANDA:\nSala 2")
  end
end
