class Track < ApplicationRecord
   validates :song, presence: true

   has_one :band,
      class_name: :Band,
      foreign_key: :band_id
   
   belongs_to :album,
      class_name: :Album,
      foreign_key: :album_id
end

# == Schema Information
#
# Table name: tracks
#
#  id         :integer(8)      not null, primary key
#  album_id   :integer(4)      not null
#  song       :string          not null
#  ord        :integer(4)      not null
#  lyrics     :text
#  band_id    :string          not null
#  bonus      :boolean
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

