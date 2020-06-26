class Chat < ActiveRecord::Base
    has_many :messages, as: :messageable
    #has_many :users, thorugh: :messages
    #has_and_belongs_to_many :users
   # has_many :chat_messages
    has_many :chat_users
    has_many :users, through: :chat_users
    #has_many :chat_messages
    

    # def message(sender, receiver, content)
    #     Message.create(receiver_id: receiver.id, sender_id: sender.id, content: content, messageable_id: self.id, messageable_type: self.class.to_s)
    # end

    # def message(chat, content)
    #     Message.create(receiver_id: receiver.id, sender_id: sender.id, content: content, messageable_id: self.id, messageable_type: self.class.to_s)
    # end

   

end