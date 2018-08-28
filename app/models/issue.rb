class Issue < ApplicationRecord
  has_attachments :photos, maximum: 6

  has_many :comments, dependent: :destroy
  has_many :fix_reports, dependent: :destroy
  has_many :votes, dependent: :destroy
  belongs_to :user

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :title, :description, presence: true

  enum fix_status: { en_attente: 0, en_cours: 1, resolu: 2 }

  def vote_count
    votes.sum('direction')
  end

  def vote_count=(new_vote_count)
    new_vote_count.times do
      self.votes.create(direction: +1, user: User.first)
    end
  end
end
