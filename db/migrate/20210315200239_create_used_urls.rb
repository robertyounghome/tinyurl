class CreateUsedUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :used_urls, id: false do |t|
      t.string :short_name
      t.string :long_name
      t.datetime :last_used
      t.timestamps
    end

    add_index :used_urls, :short_name, unique: true
    add_index :used_urls, :last_used
  end
end
