class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :user, null: false
      t.belongs_to :bet, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
