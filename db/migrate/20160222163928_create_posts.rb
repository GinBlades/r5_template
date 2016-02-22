class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.belongs_to :user, foreign_key: true, null: false
      t.string :name, null: false
      t.string :slug, null: false
      t.string :body, null: false
      t.datetime :publish, null: false
      t.integer :status, default: 0

      t.timestamps
      t.index :slug, unique: true
    end
  end
end
