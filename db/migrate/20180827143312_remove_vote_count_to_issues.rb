class RemoveVoteCountToIssues < ActiveRecord::Migration[5.2]
  def change
    remove_column :issues, :vote_count
  end
end
