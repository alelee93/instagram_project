class Post < ActiveRecord::Base
    require_relative '../uploader/post_uploader'
    #validates :url, presence: true, uniqueness: true
    mount_uploader :post, PostUploader

    belongs_to :user
    has_many :post_interests, dependent: :destroy
    has_many :interests, through: :post_interests

    has_many :reactions, as: :reactionable

    has_many :messages, as: :messageable

    def react(reaction_name, user_reacting)
        Reaction.create(name: reaction_name, user_id: user_reacting.id, reactionable_id: self.user.id, reactionable_type: self.class.to_s)
    end

    # def message(sender, receiver, content)
    #     Message.create(receiver_id: receiver.id, sender_id: sender.id, content: content, messageable_id: self.user.id, messageable_type: self.class.to_s)
    # end


end