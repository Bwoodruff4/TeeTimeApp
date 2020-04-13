class CreateGolfersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :golfers do |t|
      t.string :name
      t.integer :party_size
    end
  end
end
