class RemoveAdmonitionFromDocumentsStorages < ActiveRecord::Migration[7.0]
  def change
    remove_reference :documents_storages, :admonition, foreign_key: true

  end
end
