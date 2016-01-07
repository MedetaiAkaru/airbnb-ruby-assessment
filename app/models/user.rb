class User < ActiveRecord::Base
	validates :email, uniqueness: true
	validates :email, presence: true
	has_many :properties
	has_many :comments
	has_many :bookings
end