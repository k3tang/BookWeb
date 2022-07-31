class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :ISBN, null:false
      t.string :title, null:false
      t.string :author, null:false
      t.string :pages, null:false
      t.string :f_date, null: false
      t.string :rating 
      t.string :review_title, null: false
      t.text :review 
      t.references :user, null: false, foreign_key: true


      t.timestamps
    end
  end
end
