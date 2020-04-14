class CreateCoursesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :public
      t.integer :cost
      t.string :driving_range 
    end
  end
end

