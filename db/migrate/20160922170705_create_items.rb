class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :user, index: true
      t.references :category, index: true

      t.timestamps null: false
    end
    add_foreign_key :items, :users
    add_foreign_key :items, :categories
  end
end
