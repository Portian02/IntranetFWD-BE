class CreateTypeUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :type_users do |t|
      t.string :type_name
      t.text :description
      t.timestamps
    end
  end
end
