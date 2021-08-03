class CatRentalRequests < ApplicationRecord
    validates :cat_id, :start_date, :end_date, :status, presence: true
    validates :status, inclusion: ['pending', 'approved', 'denied']

    belongs_to :cat,
        foreign_key: :cat_id,
        class_name: 'Cat',


    def overlapping_requests

        CatRentalRequests.where.not(id: catrentalrequest.id) !=
    end
end