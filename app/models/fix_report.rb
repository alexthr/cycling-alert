class FixReport < ApplicationRecord
  belongs_to :issue
  belongs_to :user

  # validates :user, uniqueness: { scope: :issue }
end
