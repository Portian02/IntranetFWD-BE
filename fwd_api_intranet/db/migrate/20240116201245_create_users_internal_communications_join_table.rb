class CreateUsersInternalCommunicationsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :internal_communications do |t|
      t.index :user_id
      t.index :internal_communication_id
    end
  end
end
