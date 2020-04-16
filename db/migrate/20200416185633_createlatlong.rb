class Createlatlong < ActiveRecord::Migration[6.0]
  def change
    change_table :courses do |t|
    t.string :latitude
    t.string :longitude
    end
  end
end
