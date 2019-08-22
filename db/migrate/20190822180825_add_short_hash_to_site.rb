class AddShortHashToSite < ActiveRecord::Migration[5.2]
  def change
    add_column :sites, :short_hash, :string
  end
end