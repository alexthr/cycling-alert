class ChangeFixStatusToIssues < ActiveRecord::Migration[5.2]
  def change
    change_column_default :issues, :fix_status, 0
  end
end
