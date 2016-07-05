class UserController < ApplicationController
	before_action :set_id, only: [:edit, :update, :destroy]

	def index	
		@users = User.all_except(current_user)
	end

	def new
		@user = User.new
	end	

	def create
		@user = User.new(user_params)
		if @user.save
			UserMailer.welcome_email(@user,@password).deliver
			redirect_to  user_index_path
		end	
	end		

	def edit
	end	

	def update
		params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
		if @user.update(user_params)
			# UserMailer.welcome_email(@user,@password).deliver
			redirect_to  user_index_path
		end	
	end	

	def send_request
		@user = User.find(params[:id])
		current_user.requests.create(:receiver_id=>params[:id])
		redirect_to user_index_path
	end

	def recieve_request
		@request = Request.where(:receiver_id=>current_user.id).map(&:sender_id)
		@users = User.where(:id=>@request)
	end	

	def user_send_request
		@send_request = current_user.requests.map(&:receiver_id)
		@users = User.where(:id=>@send_request)
	end	

	def confirm
		@user = Request.find_by_id(params[:id])
		@user.update(:status=>params[:status])
		redirect_to recieve_path
	end	


	def destroy
		if @user.destroy
			redirect_to  user_index_path
		end	
	end	

	private

	def set_id
		@user = User.find(params[:id])
	end	

	def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
