class User < ActiveRecord::Base
    has_secure_password
    validates :email, uniqueness: true

    has_many :posts
    has_many :user_interests, dependent: :destroy
    has_many :interests, through: :user_interests

    has_many :reactions

    #has_many :sent_messages, foreign_key: 'sender_id', class_name: 'Message'
    #has_many :received_messages, foreign_key: 'receiver_id', class_name: 'Message'
    
    has_many :following_users, foreign_key: 'follower_id'
    has_many :follower_users, foreign_key: 'following_id', class_name: 'FollowingUser'
    has_many :following, through: :following_users, foreign_key: 'following_id', class_name: 'User'
    has_many :followers, through: :follower_users, foreign_key: 'follower_id', class_name: 'User'

    has_many :chat_user
    #has_many :chat_messages, through: :chat_user
    #has_many :messages, as: :messageable

    has_many :chats, through: :chat_user

    #has_and_belongs_to_many :chats
    #has_many :chat_admin, foreign_key: 'admin_participant_id', class_name: 'Chat'
    #belongs_to :chat

    def follows(user)
        FollowingUser.create(follower_id: self.id, following_id: user.id) 
    end

    # def message(user, content)
    #   # Message.create(receiver_id: user.id, sender_id: self.id, content: content)
    # end

 
    def new_chat_room(chat_name)
        Chat.create(name: chat_name, admin_participant_id: self.id)
    end

    def add_user_to_chat(chat, user)
        ChatUser.create(chat_id: chat.id, user_id: user.id)
    end

    def send_chat_message(message, chat)
        Message.create(sender_id: self.id, content: message, messageable_id: chat.id, messageable_type: 'Chat')
        #ChatMessage.create(chat.id, new_message.id)
    end

    def comment_on_post(post, comment)
        Message.create(sender_id: self.id, content: comment, messageable_id: post.id, messageable_type: 'Post')
    end


    def slug
        username = self.username
        slug = username.downcase.strip.gsub(" ", "-").gsub(/[^\w-]/, '')
    end
    
    def self.find_by_slug(slug)
        self.all.detect do |t|
            t.slug == slug
        end
    end
 
    
end