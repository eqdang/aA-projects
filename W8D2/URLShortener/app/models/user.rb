class User < ApplicationRecord
    validates :email, presence: true
    validates :email, uniqueness: true 

    has_many :visited_urls,
        class_name: 'ShortenedUrl',
        primary_key: :id,
        foreign_key: :user_id

    has_many :visits,
        through: :visited_urls,
        source: :visit

end