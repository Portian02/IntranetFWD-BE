class RemoveDocumentsStorageFromJustifications < ActiveRecord::Migration[7.0]
  def change
    remove_reference :justifications, :documents_storage, foreign_key: true
  end
end
