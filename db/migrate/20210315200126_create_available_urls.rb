class CreateAvailableUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :available_urls, id: false do |t|
      t.string :name
    end

  end
end
