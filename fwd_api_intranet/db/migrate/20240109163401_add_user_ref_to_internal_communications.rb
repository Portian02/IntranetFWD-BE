class AddUserRefToInternalCommunications < ActiveRecord::Migration[7.0]
  def change
    add_reference :internal_communications, :user, null: false, foreign_key: true
  end
end
