class CreateChats < ActiveRecord::Migration[5.1]
  def change
    create_table :chats do |t|
      t.string :name
      t.references :user_one, foreign_key: { to_table: :users }, index: true
      t.references :user_two, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
  end
end
