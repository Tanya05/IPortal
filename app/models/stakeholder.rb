class Stakeholder < ActiveRecord::Base
	has_many :ips
	has_many :users
	validates :name, presence: true 
	validates :percentage, presence: true
end
