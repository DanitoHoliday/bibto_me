class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :code
      t.boolean :registered
      t.string :category
      t.string :type
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
