class Reaction < ActiveRecord::Base
    belongs_to :reactionable, polymorphic: true
    belongs_to :user
end