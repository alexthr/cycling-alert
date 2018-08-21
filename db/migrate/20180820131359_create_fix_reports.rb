class CreateFixReports < ActiveRecord::Migration[5.2]
  def change
    create_table :fix_reports do |t|
      t.references :issue, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
