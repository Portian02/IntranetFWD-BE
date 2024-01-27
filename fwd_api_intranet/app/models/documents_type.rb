class DocumentsType < ApplicationRecord
  validates :type_name, presence: true, uniqueness: true
  validates :description, presence: true, length: { maximum: 500 }
end
