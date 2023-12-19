class CreateCalendarEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :calendar_events do |t|
      t.string :name
      t.text   :description
      t.date   :date
      t.blob   :document

     t.timestamps
    end
  end
end
