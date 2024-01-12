class RemoveDocumentsStorageFromAdmonitions < ActiveRecord::Migration[7.0]
  def change
    remove_reference :admonitions, :documents_storage, foreign_key: true
  end
end
