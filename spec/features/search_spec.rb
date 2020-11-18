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

  it "I can enter a gibberish movie title and it wont break" do
    visit '/'
    fill_in :search_title, with: "jshdfLASDKJFHSLJFH"
    click_on "Search Movies"
    expect(page).to have_content("No Results Found")
    expect(page).to have_link("Try another search")
  end

  it "After ive searched, I can click a movie's title and see more detailed info" do
    visit '/'
    fill_in :search_title, with: "Lord of the Rings"
    click_on "Search Movies"
    expect(page).to have_link("The Lord of the Rings: The Two Towers")
    click_link("The Lord of the Rings: The Two Towers")
    expect(page).to have_content("Release Date: 2002-12-18")
    expect(page).to have_content("Frodo and Sam are trekking to Mordor to destroy the One Ring of Power while Gimli, Legolas and Aragorn search for the orc-captured Merry and Pippin. All along, nefarious wizard Saruman awaits the Fellowship members at the Orthanc Tower in Isengard.")
  end
end
