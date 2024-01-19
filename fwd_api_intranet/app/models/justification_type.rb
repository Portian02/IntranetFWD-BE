class JustificationType < ApplicationRecord
   validates :name, presence: true, length: { maximum: 255 }
   validates :description, presence: true
end
