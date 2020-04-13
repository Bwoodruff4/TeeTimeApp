class CreateTeetimesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :teetimes do |t|
      t.string :reservation_time
      t.references :course, foreign_key: true
      t.references :golfer, foreign_key: true 
    end
  end
end
