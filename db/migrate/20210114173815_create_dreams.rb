class CreateDreams < ActiveRecord::Migration[6.1]
  def change
    create_table :dreams do |t|
      t.string :title
      t.text :content
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :theme, null: false, foreign_key: true

      t.timestamps
    end
  end
end
