require 'rails_helper'

RSpec.describe 'When I visit the root page' do
  it 'I see a search bar where I can enter the title of a movie' do
    visit '/'
    expect(page).to have_content("Welcome to Movie Search")
    fill_in :search_title, with: "Vertigo"
    click_on "Search Movies"
  end
end
