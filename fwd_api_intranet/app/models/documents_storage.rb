class DocumentsStorage < ApplicationRecord
 
 validates :name, presence: true
 validates :description, presence: true
 validates :url, presence: true
 validates :documents_type_id, presence: true
 


  belongs_to :documents_type
end
