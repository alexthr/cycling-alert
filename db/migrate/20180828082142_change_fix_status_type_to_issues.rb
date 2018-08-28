class ChangeFixStatusTypeToIssues < ActiveRecord::Migration[5.2]
  def change
    remove_column :issues, :fix_status
    add_column :issues, :fix_status, :integer, default: 0
  end
end
