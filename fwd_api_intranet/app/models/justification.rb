class Justification < ApplicationRecord
  belongs_to :user
  belongs_to :justification_type, class_name: 'JustificationType', foreign_key: 'justification_types_id'

  validates :justification_types_id, presence: true
  validates :user_id, presence: true
  validates :date, presence: true
  validates :responsable_id, presence: true
  validates :status_justification, presence: true

end
