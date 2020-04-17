class AddColumnsToCoursesTable < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :public, :string
    add_column :courses, :cost, :integer
    add_column :courses, :driving_range, :string
  end
end
