class Rental
  def initialize movie, days_rented
    @movie = movie
    @days_rented = days_rented
  end

  def get_days_rented
    @days_rented
  end

  def get_movie
    @movie
  end

end
