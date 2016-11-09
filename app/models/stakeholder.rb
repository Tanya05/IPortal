class Stakeholder < ActiveRecord::Base
	has_many :ips
	has_many :users
end
