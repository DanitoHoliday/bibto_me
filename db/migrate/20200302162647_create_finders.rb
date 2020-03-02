class CreateFinders < ActiveRecord::Migration[5.2]
  def change
    create_table :finders do |t|
      t.text :message
      t.string :phone
      t.string :email
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
