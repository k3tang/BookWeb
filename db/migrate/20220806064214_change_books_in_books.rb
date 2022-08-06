class ChangeBooksInBooks < ActiveRecord::Migration[7.0]
  def change
    rename_column :books, :author, :authors
    add_column :books, :categories, :jsonb
    add_column :books, :image_links, :jsonb
  end
end
