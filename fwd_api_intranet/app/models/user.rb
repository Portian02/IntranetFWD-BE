class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,
  :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist




  enum role: [:student, :admin, :teacher ]
  validates :identification, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :number, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@fwdcostarica\.com\z/i }
  validates :borndate, presence: true
  validates :role, presence: true
  validates :type_user_id, presence: true
  validates :jti, presence: true, uniqueness: true
  belongs_to :type_user
  before_validation :set_default_password, on: :create

  private

  def set_default_password
    self.password ||= 'fwd1234'
  end

end
