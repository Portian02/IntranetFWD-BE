class CreateDocumentsTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :documents_types do |t|
      t.string :type_name
      t.text :description
      t.timestamps
    end
  end
end
