class UserAdmonitions < ApplicationRecord
    belongs_to :user
    belongs_to :admonition
end
