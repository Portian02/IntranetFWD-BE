class Announcement < ApplicationRecord
    validates :content, presence: true
    validates :date, presence: true
    validates :description, presence: true
  
end
