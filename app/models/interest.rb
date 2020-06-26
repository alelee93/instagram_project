class Interest < ActiveRecord::Base
    
    has_many :post_interests, dependent: :destroy
    has_many :posts, through: :post_interests

    has_many :user_interests, dependent: :destroy
    has_many :users, through: :user_interests
end