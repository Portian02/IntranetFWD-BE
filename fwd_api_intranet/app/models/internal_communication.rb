class InternalCommunication < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :date, presence: true
  validates :user_id, presence: true
end
