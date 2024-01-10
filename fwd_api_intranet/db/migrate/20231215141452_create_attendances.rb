class CreateAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :attendances do |t|
      t.date :date
      t.references :user, null: false, foreign_key: true
      t.references :status_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
