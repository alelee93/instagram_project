class Message < ActiveRecord::Base
    belongs_to :user
    
    belongs_to :messageable, polymorphic: true

    has_many :reactions, as: :reactionable

    has_many :chat_messages


    def react(reaction_name, user_reacting)
        Reaction.create(name: reaction_name, user_id: user_reacting.id, reactionable_id: self.sender_id, reactionable_type: self.class.to_s)
    end

end