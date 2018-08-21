class User < ApplicationRecord
  has_many :issues
  has_many :comments
  has_many :fix_reports
  has_many :votes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, :password, :email, presence: true
  validates :username, :email, uniqueness: true
end
