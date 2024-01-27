class CreateAdmonitions < ActiveRecord::Migration[7.0]
  def change
    create_table :admonitions do |t|
      t.string :status_admonition
      t.date :date
      t.string :responsable_id
      t.references :user, foreign_key: true
      t.references :admonition_types, foreign_key: true
      t.timestamps
    end
  end
end
