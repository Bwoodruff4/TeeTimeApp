class AddColumnsToCoursesTable < ActiveRecord::Migration[6.0]
  def change
    change_table :courses do |t|
      t.string :public
      t.integer :cost 
      t.string :driving_range
    end
  end
end
