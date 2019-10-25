class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest

      t.string :bio
      t.string :hobbies
      t.integer :age
      t.string :country
      t.string :city
      t.string :phone_number
      t.string :image_url, :default => "https://252radio.com/wp-content/uploads/2016/11/default-user-image-300x300.png"
      t.string :song, :default => "5FVd6KXrgO9B3JPmC8OPst" 
      t.timestamps
    end
  end
end
