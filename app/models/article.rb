class Article < ApplicationRecord
    validates :title, presence: true, length: {minimum: 3, maximum: 20}
    validates :description, presence: true, length: {minimum: 6, maximum: 40}
end