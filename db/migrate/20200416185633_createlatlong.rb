class Createlatlong < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :latitude, :string
    add_column :courses, :longitude, :string

  end
end
