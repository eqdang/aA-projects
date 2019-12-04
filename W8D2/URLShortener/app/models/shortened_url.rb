require 'securerandom'

class ShortenedUrl < ApplicationRecord
    validates :long_url, presence: true
    validates :long_url, uniqueness: true
    validates :short_url, presence: true
    validates :short_url, uniqueness: true

    belongs_to :user,
        class_name: 'User',
        primary_key: :id, 
        foreign_key: :user_id
    





    def self.random_code
        loop do
            code = SecureRandom.urlsafe_base64(16)
            return code unless ShortenedUrl.exists?(:short_url=>code)
        end
    end

    def self.generate(user, long_url)
        ShortenedUrl.create!(:long_url=>long_url, :user_id=>user.id, :short_url=>ShortenedUrl.random_code)
    end
end