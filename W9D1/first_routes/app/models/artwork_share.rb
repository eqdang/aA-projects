class ArtworkShare < ApplicationRecord

    validates :artwork, presence: true
    validates :viewer, presence: true

    belongs_to :viewer,
        foreign_key: :viewer_id,
        class_name: :User
    
    belongs_to :artwork,
        foreign_key: :artwork_id,
        class_name: :Artwork
    
    # has_many :viewers,
    #     through: :viewer,
    #     source: :shared_artworks
end


# == Schema Information
#
# Table name: artwork_shares
#
#  id         :integer(8)      not null, primary key
#  viewer_id  :integer(4)
#  artwork_id :integer(4)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

