class AddJustificationToDocumentsStorages < ActiveRecord::Migration[7.0]
  def change
    add_reference :documents_storages, :justifications, null: false, foreign_key: true
  end
end
