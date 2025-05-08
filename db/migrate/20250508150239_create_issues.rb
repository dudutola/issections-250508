class CreateIssues < ActiveRecord::Migration[7.1]
  def change
    create_table :issues do |t|
      t.string :title
      t.text :problem
      t.text :solution
      t.boolean :solved
      t.references :section, null: false, foreign_key: true

      t.timestamps
    end
  end
end
