class Contract < ActiveRecord::Base
	has_many :contract_details
	belongs_to :ip
end
