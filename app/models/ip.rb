class Ip < ActiveRecord::Base
	has _many :stakeholders
	has_many :contracts
end
