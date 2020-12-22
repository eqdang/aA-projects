class Album < ApplicationRecord

   validates :title, presence: true

   belongs_to :band,
      class_name: :Band,
      foreign_key: :band_id

   has_many :tracks, 
      class_name: :Track,
      foreign_key: :album_id,
      dependent: :destroy
end

# == Schema Information
#
# Table name: albums
#
#  id         :integer(8)      not null, primary key
#  band_id    :integer(4)      not null
#  title      :string          not null
#  year       :float           not null
#  album_type :string          not null
#  album_id   :integer(4)      not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

