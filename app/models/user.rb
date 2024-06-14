require 'bcrypt'
class User < ApplicationRecord
	enum role: ["receptionist", "doctor"]
	validates :email, presence: true, uniqueness: { case_sensitive: false }
	validates :password, presence: true
	validates :name, presence: true
	validates_length_of :password, :minimum => 8
	validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "Invalid email",:if => lambda{ |object| object.email.present? }
	before_save :encrypt_password, if: :password_changed? #will_save_change_to_password?
	has_many :posts

	# jaise hi user create hoga, us user ki post bhi create ho jayegi is code se
	# after_create :create_application
	# has_one :post
	# def create_application
	# 	create_post
	# end

	def encrypt_password
		self.password = BCrypt::Password.create(self.password)
	end

	def password_changed?
		# will_save_change_to_password?
		will_save_change_to_attribute?(:password)
	end


	# for This is after save
	# after_save :encrypt_password
	# def encrypt_password
	# 	if saved_change_to_password?
	# 		password = BCrypt::Password.create(self.password)
	# 		self.update_column(:password, password)
	# 	end
	# end
end
