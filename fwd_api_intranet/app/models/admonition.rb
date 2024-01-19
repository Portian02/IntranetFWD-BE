class Admonition < ApplicationRecord

    validates :admonition_types_id, presence: true
    validates :user_id, presence: true
    validates :date, presence: true
    validates :responsable_id, presence: true
    validates :status_admonition, presence: true

end
