class Movie
    attr_reader :id,
                :title,
                :release_date,
                :poster_url,
                :overview

  def initialize(movie)
    # binding.pry
    @id = movie[:id]
    @title = movie[:title]
    @release_date = movie[:release_date]
    @poster_url = movie[:poster_path]
    @overview = movie[:overview]
  end
end
