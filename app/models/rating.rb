class Rating < ApplicationRecord

  validates :title, presence: true
  validates :movie_id, presence: true
  validates :thumbs_up, presence: true
  validates :thumbs_down, presence: true

end
