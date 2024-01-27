# app/models/admonition_type.rb
class AdmonitionType < ApplicationRecord

  validates :name, presence: true, length: { maximum: 255 }
  validates :description, presence: true

  has_many :admonitions
end

