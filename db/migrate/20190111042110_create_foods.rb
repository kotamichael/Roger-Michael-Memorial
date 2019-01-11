class CreateFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :foods do |t|
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :foods, [:user_id, :created_at]
  end
end
