class CreatePages < ActiveRecord::Migration[6.0]
  def change
    create_table :pages do |t|
      t.string :title
      t.string :content
      t.integer :user_id
      t.integer :views, :default => 0

      t.timestamps
    end
  end
end
