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
  def self.with_ratings(ratings_list, header_clicked)
#     if ratings_list == nil and header_clicked == nil and (session[0] != nil or session[1] != nil)
#       if session[0] != nil
#         ratings_list = session[0]
#       end
#       header_clicked = session[1]
#     end
    
#     byebug
    if ratings_list == []
      return Movie.all.order(header_clicked) unless header_clicked == nil
      return Movie.all
    end

    keys = ratings_list.map(&:downcase)
    if header_clicked == nil
      return Movie.where("lower(rating) IN (?)", keys)
    else
      return Movie.where("lower(rating) IN (?)", keys).order(header_clicked)
    end
  end
  
  def self.header_clicked(header_clicked, movies)
     if header_clicked == nil
       return movies
     end
     return movies.order(header_clicked)
  end

  
end
