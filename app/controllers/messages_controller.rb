class MessagesController < ApplicationController

	def	send_messages
		@message = Message.new
		@user = User.find(params[:user_id])
		@messages = @user.messages
	end

	def create_messages
		@user = User.find(params[:user_id])  
		@message = @user.messages.build(:sender_id=>current_user.id,:message_box=>params[:message][:message_box])
		if @message.save
			redirect_to send_messages_path
		end	
	end	

end
