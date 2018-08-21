class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|
      t.string :title
      t.text :description
      t.text :solution
      t.json :photos
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :fix_status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
