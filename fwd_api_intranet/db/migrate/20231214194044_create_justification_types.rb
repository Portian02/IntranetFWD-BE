class CreateJustificationTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :justification_types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
