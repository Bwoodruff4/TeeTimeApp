class AddColumnsToGolferTab < ActiveRecord::Migration[6.0]
  def change
    add_column :golfers, :age, :integer
    add_column :golfers, :handicap, :integer
      
  end
end
