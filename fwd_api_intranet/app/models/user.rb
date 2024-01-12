class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,
  :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  include Devise::JWT::RevocationStrategies::JTIMatcher





  enum role: [:student, :admin, :teacher ]
  validates :identification, presence: true
  validates :username, presence: true
  validates :number, presence: true
  validates :email, presence: true
  validates :borndate, presence: true


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  # :recoverable, :validatable, :jwt_authenticatable,
  # jwt_revocation_strategy: self






end
