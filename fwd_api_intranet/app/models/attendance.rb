class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :status_type
end
