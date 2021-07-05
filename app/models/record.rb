class Record < ApplicationRecord

	belongs_to :user

	has_many :comments

	before_save { self.email = email.downcase }

	validates :first_name, presence: true, length: { minimum: 3, maximum: 100 }

	validates :last_name, presence: true, length: { minimum: 3, maximum: 100 }

	validates :address, presence: true, length: { minimum: 10, maximum: 100 }

	validates :phone, presence: true, uniqueness: true, numericality: { only_integer: true }, length: { minimum: 10, maximum: 15 }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	
	validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 105 }, format: { with: VALID_EMAIL_REGEX }

	 def full_name
	  	return "#{first_name} #{last_name}"
	 end

	 def self.search(param)
	    param.strip!
	    to_send_back = (first_name_matches(param) + last_name_matches(param) + email_matches(param) + phone_matches(param)).uniq
	    return nil unless to_send_back
	    to_send_back
	 end

	 def self.first_name_matches(param)
	    matches('first_name', param)
	 end

	 def self.last_name_matches(param)
	    matches('last_name', param)
	 end

	 def self.email_matches(param)
	    matches('email', param)
	 end

	 def self.phone_matches(param)
	    matches('phone', param)
	 end

	 def self.matches(field_name, param)
	    where("#{field_name} like ?", "%#{param}%")
	 end

	 
end 