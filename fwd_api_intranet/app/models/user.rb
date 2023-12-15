class User < ApplicationRecord
  validates :identification, presence: true
  validates :username, presence: true
  validates :number, presence: true
  validates :email, presence: true
  validates :age, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
