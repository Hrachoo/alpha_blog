class User < ApplicationRecord
    validates :username, 
                    presence: true, 
                    length: {minimum: 3, maximum: 20}, 
                    uniqueness: { case_sensitive: false }
    validates :email, 
                    presence: true, 
                    length: {minimum: 7, maximum: 40}, 
                    uniqueness: { case_sensitive: false }
                    format: URI::MailTo::EMAIL_REGEXP
end