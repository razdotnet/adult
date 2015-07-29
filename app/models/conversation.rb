class Conversation < ActiveRecord::Base
 
	has_many :messages
	belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
	belongs_to :recipient, foreign_key: :recipient_id, class_name: 'User'

	def self.between(recipient_id, sender_id)
		where("(recipient_id = ? AND sender_id = ? OR sender_id = ? AND recipient_id = ?)", recipient_id, sender_id, recipient_id, sender_id)
	end

	def self.my_convos(user)
		where("recipient_id = ? OR sender_id = ?", user, user)
	end

	def self.email(user)
		Conversation.recipient_id.email
	end
end