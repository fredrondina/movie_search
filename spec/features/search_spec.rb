require 'rails_helper'

RSpec.describe 'When I visit the root page' do
  it 'I see a search bar where I can enter the title of a movie' do
    visit '/'
    expect(page).to have_content("Welcome to Movie Search")
    fill_in :search_title, with: "Vertigo"
    click_on "Search Movies"
  end

  it "I can enter a movie title and see a list of matches" do
    visit '/'
    fill_in :search_title, with: "Lord of the Rings"
    click_on "Search Movies"
    expect(page).to have_content("The Fellowship of the Ring")
    expect(page).to have_content("Two Towers")
    expect(page).to have_content("Return of the King")
  end
end
