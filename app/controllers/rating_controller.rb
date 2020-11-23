class RatingController < ApplicationController

  def update
    session[:rated] = [] if session[:rated].nil?
    if session[:rated].include?(params[:movie_id].to_i)
      flash.alert = "You've already rated this film, why not rate another?"
      redirect_to "/movies/#{params[:movie_id]}"
    else
      if params[:up_or_down] == 'up'
        rating = Rating.find_by('movie_id': params[:movie_id].to_i).increment!(:thumbs_up)
      elsif params[:up_or_down] == 'down'
        rating = Rating.find_by('movie_id': params[:movie_id].to_i).increment!(:thumbs_down)
      end
      session[:rated] << params[:movie_id].to_i
      redirect_to "/movies/#{rating.movie_id}"
    end
  end
end
