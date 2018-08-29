class AddLinkIdToIssues < ActiveRecord::Migration[5.2]
  def change
    add_column :issues, :link_id, :integer
  end
end
