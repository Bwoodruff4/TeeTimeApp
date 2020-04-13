class CreateCoursesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name
    end
  end
end

