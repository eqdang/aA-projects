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
#
#  id          :integer      not null, primary key
#  movie_id    :integer      not null
#  actor_id    :integer      not null
#  ord         :integer

def it_was_ok
  
  Movie.select(:id, :title, :score).where(score: [2..3])

end

def harrison_ford
  # Consider the following:
  #
  # Actor
  #   .joins(:movies)
  #   .where(movies: { title: 'Blade Runner' })
  #
  # It's possible to join based on active record relations defined in models.
  #
  # Find the id and title of all movies in which Harrison Ford
  # appeared but not as a lead actor
  # Movie.select(:id, :title).joins(:actors).where(actors:{name: 'Harrison Ford'}).where.not(castings: {ord: 1})
    
  Movie.select(:id, :title).joins(:actors).where("actors.name = 'Harrison Ford' AND castings.ord > 1")
  
end

def biggest_cast
  # Consider the following:
  # Actor
  #   .joins(:movies)
  #   .group('actors.id')
  #   .order('COUNT(movies.id) DESC')
  #   .limit(1)
  #
  # Sometimes we need to use aggregate SQL functions like COUNT, MAX, and AVG.
  # Often these are combined with group.
  #
  # Find the id and title of the 3 movies with the
  # largest casts (i.e most actors) #joi
  Movie.select(:id, :title).joins(:castings).group('movies.id').order('COUNT(castings.actor_id) DESC').limit(3)
end

def directed_by_one_of(them)
  # Consider the following:
  # Movie.where('yr IN (?)', years)
  #
  # We can use IN to test if an element is present in an array.
  #
  # ActiveRecord gives us an even better way to write this:
  #
  # Movie.where(yr: years)
  # ['George Lucas', 'Steven Spielberg']
  # Find the id and title of all the movies directed by one of 'them'.
  Movie.select(:id, :title).joins(:director).where('name IN (?)', them)
  # Movie.select(:id, :title).joins(:director).where(actors: {name: them})

  # select movies.id, movies.title
  # from movies
  # join castings
  # join actors
  # where actor.name in ('Geore Lucas', 'Steven Spielberg') AND movies.director_id NOT NULL)
end

def movie_names_before_1940
  # Movie.where('score < 2.0').pluck(:title)
  # => ['Police Academy: Mission to Moscow']
  #
  # Pluck works similarly to select, except that it converts a query result
  # directly into a Ruby Array instead of an ActiveRecord object. This can
  # improve performace for larger queries.
  # Use pluck to find the title of all movies made before 1940.
  Movie.where('yr < 1940').pluck(:title)
end
