class Contract < ActiveRecord::Base
	has_many :contract_details
	has_one :ip
end
