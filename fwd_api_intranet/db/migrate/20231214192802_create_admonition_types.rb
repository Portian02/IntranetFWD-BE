class CreateAdmonitionTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :admonition_types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
