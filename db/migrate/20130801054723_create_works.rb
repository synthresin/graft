class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :title
      t.string :client
      t.text :body

      t.timestamps
    end
  end
end
