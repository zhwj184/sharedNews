class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.integer :id
      t.string :name
      t.string :url
      t.text :content
      t.datetime :gmt_created
      t.integer :view
      t.datetime :gmt_modified
      t.integer :catid

      t.timestamps
    end
  end
end
