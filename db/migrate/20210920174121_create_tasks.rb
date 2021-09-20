class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.boolean :running, default: false
      t.date :start, default: ''
      t.date :end, default: ''
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
