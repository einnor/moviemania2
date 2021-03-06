class CreateComingsoons < ActiveRecord::Migration
  def change
    create_table :comingsoons do |t|
      t.string :title
      t.text :synopsis
      t.string :category
      t.string :youtubestub
      t.string :cinemashowing

      t.timestamps
    end
    add_index :comingsoons, [:cinema_id, :created_at]
  end
end
