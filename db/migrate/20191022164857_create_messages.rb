class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer :friendship_id
      t.string :content

      t.timestamps
    end
  end
end
