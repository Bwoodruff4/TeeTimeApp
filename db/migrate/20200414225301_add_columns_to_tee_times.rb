class AddColumnsToTeeTimes < ActiveRecord::Migration[6.0]
  def change
    change_table :teetimes do |t|
      t.integer :party_size
    end
  end
end
