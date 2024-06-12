class User < ApplicationRecord
    has_many :articles, dependent: :destroy
    before_save :email_to_downcase
    validates :username, presence: true, 
        uniqueness: { case_sensitive: false }, 
        length: { minimum: 3, maximum: 25 }
        VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
        uniqueness: { case_sensitive: false }, 
        length: { maximum: 205 },
        format: { with: VALID_EMAIL_REGEX }
        
    private
    
    def email_to_downcase
        self.email = email.downcase
    end

    has_secure_password
end