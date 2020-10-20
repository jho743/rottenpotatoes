class Movie < ActiveRecord::Base
 
  def self.all_ratings 
    ['G','PG','PG-13','R']
  end
  
  def self.ratings_to_show(params_ratings)
    if params_ratings == nil
      return []
    else
      return params_ratings.keys
    end
  end
    
  
  # if ratings_list is an array such as ['G', 'PG', 'R'], retrieve all
  #  movies with those ratings
  # if ratings_list is nil, retrieve ALL movies
  def self.with_ratings(ratings_list)
    if ratings_list == nil
      return Movie.all
    end
    
    keys = ratings_list.keys.map(&:downcase)
    return Movie.where("lower(rating) IN (?)", keys)
  end
  
end
