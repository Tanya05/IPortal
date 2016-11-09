class ContractDetail < ActiveRecord::Base
	has_one :contract
	has_many :users
end
