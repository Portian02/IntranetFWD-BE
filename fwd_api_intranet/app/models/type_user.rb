class TypeUser < ApplicationRecord
  validates :type_name, presence: true
  validates :description, presence: true, length: { maximum: 1000 }
end
