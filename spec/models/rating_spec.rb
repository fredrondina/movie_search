require 'rails_helper'

RSpec.describe Rating, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:thumbs_up) }
    it { should validate_presence_of(:thumbs_down) }
  end
end
