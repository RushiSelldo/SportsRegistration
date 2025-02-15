class CreateRegistrations < ActiveRecord::Migration[8.0]
  def change
    create_table :registrations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :match, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
