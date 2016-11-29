class Ip < ActiveRecord::Base
	has_many :stakeholders
	has_many :contracts 
	has_many :users, through: :stakeholders
	has_many :contract_details, through: :contract 
	mount_uploader :uploads, AttachmentUploader # Tells rails to use this uploader for this model.
 	validates :title, presence: true # Make sure the owner's name is present.
 	validates :description, presence: true 
 	validates :Type, presence: true 
 	validates :uploads, presence: true 
 	validates :iiitbStake, :numericality => { :greater_than_or_equal_to => 20.0 }
 	TYPES = ['Research', 'Project', 'Classroom']

end
