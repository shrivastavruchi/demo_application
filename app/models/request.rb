class Request < ActiveRecord::Base
	belongs_to :user, foreign_key: 'reciever_id'
end
