class Rating < ApplicationRecord

  validates :title, presence: true
  validates :movie_id, presence: true
  validates :thumbs_up, presence: true
  validates :thumbs_down, presence: true

  def rated?
    return false if self.thumbs_up + self.thumbs_down == 0
    true
  end

end
