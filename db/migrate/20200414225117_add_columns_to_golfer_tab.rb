class AddColumnsToGolferTab < ActiveRecord::Migration[6.0]
  def change
    change_table :golfers do |t|
      t.integer :age
      t.integer :handicap
      t.remove :party_size
    end
  end
end
