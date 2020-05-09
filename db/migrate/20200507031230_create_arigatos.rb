class CreateArigatos < ActiveRecord::Migration[5.2]
  def change
    create_table :arigatos do |t|
      t.text :content

      t.timestamps
    end
  end
end
