class Issue < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :fix_reports, dependent: :destroy
  has_many :votes, dependent: :destroy
  belongs_to :user

validates :title, :description, presence: true
end
