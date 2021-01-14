class CreateReactions < ActiveRecord::Migration[6.1]
  def change
    create_table :reactions do |t|
      t.string :name
      t.text :description
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :dream, null: false, foreign_key: true

      t.timestamps
    end
  end
end
