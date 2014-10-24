require 'digest'
class User < ActiveRecord::Base
	attr_accessor :password
	before_save :encrypt_password

	has_many :notebooks
	validates_uniqueness_of :email
	validates_length_of :email, :within => 5..50
	validates_format_of :email, :with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i, :multiline => true

	validates_presence_of :password, :on => :create
	validates_confirmation_of :password

	def encrypt_password
		if password.present?
			self.password_hash = Digest::SHA1.hexdigest(password)
		end
	end

	def self.authenticate(email, password)
		user = find_by_email(email)
		if user && user.password_hash == Digest::SHA1.hexdigest(password)
			user
		else
			nil
		end
	end
end
