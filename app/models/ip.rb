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
 	TYPES = ['Research', 'Project', 'Classroom']
end
