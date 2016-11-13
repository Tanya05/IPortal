class Ip < ActiveRecord::Base
	has_many :stakeholders
	has_many :contracts
end
