class AddTimeToMatches < ActiveRecord::Migration[8.0]
  def change
    add_column :matches, :time, :time
  end
end
