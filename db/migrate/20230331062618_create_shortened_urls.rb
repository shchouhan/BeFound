class CreateShortenedUrls < ActiveRecord::Migration[7.0]
  def change
    create_table :shortened_urls do |t|
      t.string :original_url
      t.string :short_url
      t.integer :click_count

      t.timestamps
    end
    add_index :shortened_urls, :original_url, unique: true
    add_index :shortened_urls, :short_url, unique: true
  end
end
