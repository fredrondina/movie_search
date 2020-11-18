require 'rails_helper'

RSpec.describe "When I visit a movies show page" do
  it "I can view all of its attributes" do
    visit '/'
    fill_in :search_title, with: "The Shining"
    click_on "Search Movies"
    expect(page).to have_link("The Shining")
    click_link("The Shining")
    expect(page).to have_content("Release Date: 1980-05-23")
    expect(page).to have_content("Jack Torrance accepts a caretaker job at the Overlook Hotel, where he, along with his wife Wendy and their son Danny, must live isolated from the rest of the world for the winter. But they aren't prepared for the madness that lurks within.")
    expect(page).to have_content("Directed by: Stanley Kubrick")
  end
end
