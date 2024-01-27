class Admonition < ApplicationRecord
    belongs_to :user
    belongs_to :admonition_type, class_name: 'AdmonitionType', foreign_key: 'admonition_types_id'

    validates :admonition_types_id, presence: true
    validates :user_id, presence: true
    validates :date, presence: true
    validates :responsable_id, presence: true
    validates :status_admonition, presence: true


  end
