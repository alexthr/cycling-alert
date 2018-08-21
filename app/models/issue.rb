class Issue < ApplicationRecord
  has_attachments :photos, maximum: 6

  has_many :comments, dependent: :destroy
  has_many :fix_reports, dependent: :destroy
  has_many :votes, dependent: :destroy
  belongs_to :user

  validates :title, :description, :photos, presence: true

end
