# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	attr_accessible :email, :name, :password, :password_confirmation

	validates :name, presence: true, length: { maximum: 50 }
	validates :password, length: { minimum: 6 }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, uniqueness: { case_sensitive: false },
	  					format: { with: VALID_EMAIL_REGEX }

	has_secure_password
end