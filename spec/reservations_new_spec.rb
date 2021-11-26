require 'rails_helper'

RSpec.describe 'New Reservation', type: :system do
  
  it 'shows reservation form' do
    movie = create(:movie, :tlotr)
    movie_show = create(:movie_show, movie: movie)
    visit "/new_reservation/?movie_show_id=#{movie_show.id}"
    expect(page).to have_content('Reserva asientos para función')
  end

  it 'book seat' do
    movie = create(:movie, :tlotr)
    movie_show = create(:movie_show, movie: movie)
    visit "/new_reservation/?movie_show_id=#{movie_show.id}"
    fill_in "user_name", with: "John Doe"
		page.check('(1,1)')
		click_button "Registrar"
		find_by_id('(1,1)').has_css?('.disabled')
  end
end