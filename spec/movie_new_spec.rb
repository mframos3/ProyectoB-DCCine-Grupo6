require 'rails_helper'

RSpec.describe 'New Movie', type: :system do
  
  it 'shows new form' do
    visit '/movies/new'
    expect(page).to have_content('Crear Película')
  end

  it 'creates movie' do
    visit '/movies/new'
    fill_in "Nombre de la película", with: "El señor de los anillos"
    attach_file("Imagen", Rails.root.join('spec/assets/test.jpeg')) 
    click_button'Create Movie'
    expect(page).to have_content('El señor de los anillos')
  end
end