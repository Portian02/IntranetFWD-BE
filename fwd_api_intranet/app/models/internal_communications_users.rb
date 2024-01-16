class InternalCommunicationsUsers < ApplicationRecord
  belongs_to :user
  belongs_to :internal_communication
end
