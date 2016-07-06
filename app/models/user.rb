class User < ActiveRecord::Base
	scope :all_except, ->(user) { where.not(id: user) }
	has_many :requests  ,foreign_key: 'sender_id'
	has_many :messages
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  def show_user       
		joins('LEFT JOIN requests on users.id = requests.receiver_id').where("requests.receiver_id is null").count        
	end
end
