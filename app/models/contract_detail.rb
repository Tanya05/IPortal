class ContractDetail < ActiveRecord::Base
	belongs_to :contract
	has_many :users
end
