class Artwork < ApplicationRecord
    
    validates :title, presence: true
    validates :image_url, presence: true
    validates :artist_id, uniqueness: { scope: :title}

    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User
     
    has_many :artwork_shares,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare

    has_many :shared_viewers,
        through: :artwork_shares,
        source: :viewer

end
# == Schema Information
#
# Table name: artworks
#
#  id         :integer(8)      not null, primary key
#  title      :string
#  image_url  :string
#  artist_id  :integer(4)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

# == Schema Information
#
# Table name: artworks
#
#  id         :integer(8)      not null, primary key
#  title      :string
#  image_url  :string
#  artist_id  :integer(4)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

