class CreateProjectIdeas < ActiveRecord::Migration[7.1]
  def change
    create_table :project_ideas do |t|
      t.string :title
      t.text :description
      t.boolean :done, default: false

      t.timestamps
    end
  end
end
