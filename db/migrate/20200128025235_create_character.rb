class CreateCharacter < ActiveRecord::Migration[6.0]
  def change
    create_table :character do |t|
      t.string :name
      t.string :gender
      t.string :class
    end
  end
end
