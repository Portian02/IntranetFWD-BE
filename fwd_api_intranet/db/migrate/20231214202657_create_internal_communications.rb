class CreateInternalCommunications < ActiveRecord::Migration[7.0]
  def change
    create_table :internal_communications do |t|
      t.string :title
      t.string :content
      t.date :date

      t.timestamps
    end
  end
end
