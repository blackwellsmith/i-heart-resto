class Session < ApplicationRecord
    
    validates :username, presence: true
end