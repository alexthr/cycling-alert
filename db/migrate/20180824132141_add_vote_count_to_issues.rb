class AddVoteCountToIssues < ActiveRecord::Migration[5.2]
  def change
    add_column :issues, :vote_count, :integer, default: 0
  end
end
