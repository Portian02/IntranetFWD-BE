class CreateJustifications < ActiveRecord::Migration[7.0]
  def change
    create_table :justifications do |t|
      t.string :status_justification
      t.date :date
      t.string :responsable_id
      t.references :user, foreign_key: true
      t.references :justification_types, foreign_key: true
      t.references :documents_storage, foreign_key: true
      t.timestamps
    end
  end
end
