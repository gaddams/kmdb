class QuestionsController < ApplicationController
  def question_1
    # How many movies are in the database?

    # Your Ruby goes here.

    @number_of_movies = Movie.count
  end

  def question_2
    # In what year was the oldest movie on the list released?

    # Your Ruby goes here.

    # @year_of_oldest_movie = ???

    #movies_by_year_sorted = @movies_by_year.order("year DESC")
    list_of_movies = Movie.order("year ASC")
    @year_of_oldest_movie = list_of_movies.first.year

  end

  def question_3
    # How many movies does the director of the first movie have on the list?

    # Your Ruby goes here.
    list_of_movies = Movie.order("year ASC")
    director_id_of_first_movie = list_of_movies.first.director_id
    @number_of_movies_directed_by_first_movie_director = Movie.where(:director_id => director_id_of_first_movie).count
  end

  def question_4
    # What is the most number of movies any single director has on the list?

    # Your Ruby goes here.
    # You'll probably have to use both ActiveRecord query methods as well as some plain old Ruby logic.

    list_of_movies = Movie.all

    no_of_movies = 0

    list_of_movies.each do |movie|
      no_of_movies_new = Movie.where(:director_id => movie.director_id).count

      if no_of_movies < no_of_movies_new
        no_of_movies = no_of_movies_new
      end
    end
   @most_number_of_movies_by_a_single_director = no_of_movies
  end

  def question_5
    # What is the most recent movie on the list that the first actor appeared in?

    # Your Ruby goes here.
    # You'll probably have to use both ActiveRecord query methods as well as some plain old Ruby logic.

    first_actor = Actor.first.id
    all_roles_by_first_actor = Role.where(:actor_id => first_actor)

    year = 0
    all_roles_by_first_actor.each do |role|

    year1 = Movie.find_by(:id => role.movie_id).year

    if year < year1.to_i
      @most_recent_movie_for_first_actor = Movie.find_by(:id => role.movie_id).title
    end
end

  end
end
