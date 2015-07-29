class MessagesController < ApplicationController
	
	before_action do
		@conversation = Conversation.find(params[:conversation_id])
	end
	
	def index
			user = current_user
		#@messages1 = @conversation.messages
		if @conversation.sender == user || @conversation.recipient == user
			@messages = @conversation.messages.where.not(id: nil)
			@message = @conversation.messages.new
		else
			redirect_to root_url, notice: 'Youre not included in this convo'
		end
	end

	def create
		@message = @conversation.messages.build message_params

		if @message.save
			redirect_to conversation_messages_path(@conversation)
		else
			render('new')
		end
	end

	private

	def message_params
		params.require(:message).permit(:user_id, :body)
	end
end