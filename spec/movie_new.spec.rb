require 'rails_helper'

RSpec.describe 'New Movie', type: :system do
  it 'new' do
    visit '/movies/new'
    expect(page).to have_content('Crear Película')
  end
end