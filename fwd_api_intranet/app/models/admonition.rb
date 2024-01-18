class Admonition < ApplicationRecord

validates :admonition_types_id, presence: true
validates :user_id, presence: true
validates :date, presence: true
validates :responsable_id, presence: true
validates :status_admonition, presence: true


# has_many :user_admonitions
# has_many :users, through: :user_admonitions
# has_one :admonition_type

end
