class Restaurant < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews
end

#@restaurant = taco trucks 

#taco trucks has many reviews (collection of reviews) ===> an array 
# .reviews <<< method given through activerecord assocation has_many #
