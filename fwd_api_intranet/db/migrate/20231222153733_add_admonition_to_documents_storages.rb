class AddAdmonitionToDocumentsStorages < ActiveRecord::Migration[7.0]
  def change
    add_reference :documents_storages, :admonitions, null: false, foreign_key: true
  end
end
