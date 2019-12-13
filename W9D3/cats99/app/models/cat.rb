require 'action_view'
class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper
    validates :birth_date, :color, :name, :sex, :description, presence: true
    validates :color, inclusion: {in: ['red', 'blue', 'green']}
    validates :sex, inclusion: {in: ['m', 'f']}

    has_many :cat_rental_requests,
        foreign_key: :cat_id,
        class_name: 'CatRentalRequests',
        dependent: :destroy

    def age 
        time_ago_in_words(birth_date)
    end
end

