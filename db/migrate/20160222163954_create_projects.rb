class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.string :body, null: false
      t.date :start, null: false
      t.date :finish
      t.integer :status, default: 0

      t.timestamps
      t.index :slug, unique: true
    end
  end
end
