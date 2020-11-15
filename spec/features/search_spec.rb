require 'rails_helper'

RSpec.describe 'When I visit the root page' do
  it 'I see a search bar where I can enter the title of a movie' do
    visit '/'
    save_and_open_page
  end
end
