class CreateMatches < ActiveRecord::Migration[8.0]
  def change
    create_table :matches do |t|
      t.string :title
      t.string :sport_type
      t.datetime :date
      t.string :location
      t.integer :max_players
      t.references :host, null: false, foreign_key: true

      t.timestamps
    end
  end
end
