class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, force: true do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob

      t.timestamps
    end
  end
end
