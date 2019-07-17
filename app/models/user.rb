class User < ApplicationRecord
    has_secure_password

    #has_many :reviews
    #has_many :restaurants, through :reviews

    validates :username, :email, presence: true
    validates :username, :email, uniqueness: true
end
