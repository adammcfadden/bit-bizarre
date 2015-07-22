class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :body
      t.float  :price
      t.integer :user_id
      t.timestamps
    end
  end
end
