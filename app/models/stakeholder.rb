class Stakeholder < ActiveRecord::Base
	has_many :users
	belongs_to :ip
	validates :name, presence: true 
	validates :percentage, presence: true
end
