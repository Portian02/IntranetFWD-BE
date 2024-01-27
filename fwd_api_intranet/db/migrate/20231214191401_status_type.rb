class StatusType < ActiveRecord::Migration[7.0]
  def change
    create_table :status_types do |t|
      t.string :description
      t.timestamps
    end

  end
end
