class User < ActiveRecord::Base
	has_secure_password

	email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

	validates :first_name, :last_name, :email, :password, :password_confirmation, presence: true
	validates :email, uniqueness: true, format: { with: email_regex }
	validates :password, length: { minimum: 6 }
end