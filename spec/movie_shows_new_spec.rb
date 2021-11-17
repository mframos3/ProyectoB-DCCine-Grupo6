require 'rails_helper'

RSpec.describe 'New Movie Show', type: :system do
  
  it 'shows new movie show form' do
    visit '/movie_shows/new'
    expect(page).to have_content('Crear Función')
  end

  it 'creates movie show' do
    create(:movie, :star_wars)
    create(:movie, :tlotr)
    visit '/movie_shows/new'
    select 'Star Wars', from: 'movie_show_movie_id'
    fill_in 'movie_show_room', with: 2
    select 'Tanda', from: 'movie_show_showtime'
    fill_in 'movie_show_date', with: Date.today.strftime('%m/%d/%Y')
    click_button 'Create Movie show'
    expect(page).to have_content('2')
    expect(page).to have_content('tanda')
    expect(page).to have_content('Star Wars')
  end

  it 'visits movies/new' do
    visit '/movie_shows/new'
    click_button 'Agregar película'
    expect(page).to have_content('Crear Película')
  end
end