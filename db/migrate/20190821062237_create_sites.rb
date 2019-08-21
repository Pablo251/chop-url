class CreateSites < ActiveRecord::Migration[5.2]
  def change
    create_table :sites do |t|
      t.string :title
      t.string :full_url
      t.string :short_url
      t.integer :accessed_attempts

      t.timestamps
    end
  end
end
