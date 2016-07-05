class User < ActiveRecord::Base
	scope :all_except, ->(user) { where.not(id: user) }
	has_many :requests  ,foreign_key: 'sender_id'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
end
