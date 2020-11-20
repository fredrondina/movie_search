class RatingController < ApplicationController

  def update
    if params[:up_or_down] == 'up'
      rating = Rating.find(params[:rating_id].to_i).increment!(:thumbs_up)
    elsif params[:up_or_down] == 'down'
      rating = Rating.find(params[:rating_id].to_i).increment!(:thumbs_down)
    end
    redirect_to "/movies/#{rating.movie_id}"
  end
end
