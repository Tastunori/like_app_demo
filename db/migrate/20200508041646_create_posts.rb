class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :user_id
      t.string :to_user_id
      t.text :content

      t.timestamps
    end
  end
end
