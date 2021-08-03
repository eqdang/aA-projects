class Band < ApplicationRecord

   validates :name, presence: true, uniqueness: true

   has_many :albums,
      class_name: :Album,
      foreign_key: :band_id,
      dependent: :destroy
end

# == Schema Information
#
# Table name: bands
#
#  id         :integer(8)      not null, primary key
#  name       :string          not null
#  band_id    :integer(4)      not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

