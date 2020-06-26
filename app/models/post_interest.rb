class PostInterest < ActiveRecord::Base
    belongs_to :post
    belongs_to :interest
end