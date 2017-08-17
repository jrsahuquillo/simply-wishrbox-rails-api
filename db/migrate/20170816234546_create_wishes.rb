class CreateWishes < ActiveRecord::Migration[5.1]
  def change
    create_table :wishes do |t|
      t.string :title
      t.text :description
      t.string :price
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
