class CreateAnnouncements < ActiveRecord::Migration[7.0]
  def change
    create_table :announcements do |t|
      t.string :content
      t.text :description
      t.date :date

      t.timestamps
    end
  end
end
