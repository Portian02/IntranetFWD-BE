class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,
  :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  include Devise::JWT::RevocationStrategies::JTIMatcher





  enum role: [:student, :admin, :teacher ]
  validates :identification, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :number, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :borndate, presence: true
  validates :role, presence: true
  validates :type_user_id, presence: true
  validates :jti, presence: true, uniqueness: true

  belongs_to :type_user


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  # :recoverable, :validatable, :jwt_authenticatable,
  # jwt_revocation_strategy: self







end
