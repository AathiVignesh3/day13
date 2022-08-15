class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.date :due_date
      t.boolean :status

      t.timestamps
    end
  end
end
