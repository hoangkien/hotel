class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.text :content
      t.integer :admin_user_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
