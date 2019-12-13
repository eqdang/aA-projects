class Comment < ApplicationRecord

    validates :author, presence: true
    validates :artwork, presence: true
    validates :body, presence: true

    belongs_to :author,
        foreign_key: :user_id,
        class_name: :User
    
    belongs_to :artwork,
        foreign_key: :artwork_id,
        class_name: :Artwork
end


# == Schema Information
#
# Table name: comments
#
#  id         :integer(8)      not null, primary key
#  user_id    :integer(4)
#  artwork_id :integer(4)
#  body       :text
#

