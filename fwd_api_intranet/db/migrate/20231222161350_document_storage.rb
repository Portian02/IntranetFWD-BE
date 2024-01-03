
class DocumentStorage < ActiveRecord::Migration[7.0]
  def change
    create_table :documents_storages do |t|
      t.string :name
      t.text :description
      t.string :url
      t.references :documents_type, null: false, foreign_key: true
      t.references :justification, null: false, foreign_key: true
      t.references :admonition, null: false, foreign_key: true
      t.timestamps
    end
  end
end
