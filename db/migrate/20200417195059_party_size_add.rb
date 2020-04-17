class PartySizeAdd < ActiveRecord::Migration[6.0]
  def change
    add_column :teetimes, :party_size, :integer
  end
end
