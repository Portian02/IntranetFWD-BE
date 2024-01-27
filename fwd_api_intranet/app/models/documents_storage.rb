class DocumentsStorage < ApplicationRecord
 belongs_to :documents_type

 validates :name, presence: true
 validates :description, presence: true
 validates :url, presence: true
 validates :documents_type_id, presence: true
end
