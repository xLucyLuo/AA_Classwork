# == Schema Information
#
# Table name: actors
#
#  id          :integer      not null, primary key
#  name        :string
#
# Table name: movies
#
#  id          :integer      not null, primary key
#  title       :string
#  yr          :integer
#  score       :float
#  votes       :integer
#  director_id :integer
#
# Table name: castings
#  id          :integer      not null, primary key
#  movie_id    :integer      not null
#  actor_id    :integer      not null
#  ord         :integer

# IMPORTANT:
# For all of the following problems return an ActiveRecord::Association unless
# otherwise specified. 

def god_father_movies
  # Find the id, title and year of each Godfather movie
  Movie
    .select(:id, :title, :yr)
    .where("movies.title LIKE '%Godfather%'")
end

def michelle_movies
  # Find the id, title, and year of movies Michelle Pfeiffer has acted in.
  # Order them by score (descending) and title (descending).

  Movie
    .select(:id, :title, :yr)
    .joins(:actors)
    .where("actors.name = 'Michelle Pfeiffer'")
    .order("score DESC, title DESC")

end

def actor_ids_from_blade_runner
  # Return an array (NOT an ActiveRecord:Association) of the `ids` of 
  # all the actors that were in the movie "Blade Runner"

  Actor
    .joins(:movies)
    .where("title LIKE '%Blade Runner%'")
    .select(:id)
    .pluck("actors.id")
end

def best_years
  # Return an array of the years (NOT an ActiveRecord:Association) 
  # in which every movie released had a minimum rating of 8 or above.
  Movie
    .group(:yr)
    .having("MIN(score)>=8")
    .pluck(:yr)
end

def harrying_times
  # Return an array of the year(s) (NOT an ActiveRecord:Association) in which
  # Harrison Ford was in at least 2 movies. 
  Movie
    .joins(:actors)
    .where("name = 'Harrison Ford'")
    .group("yr")
    .having("COUNT(movies.id)>=2")
    .pluck(:yr)

end