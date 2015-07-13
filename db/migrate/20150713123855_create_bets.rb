class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.integer :sender_id, null: false
      t.integer :receiver_id, null: false
      t.string :title, null: false
      t.string :body, null: false
      t.string :category, null: false
      t.date :date
      t.boolean :accepted?, default: false
      t.boolean :declined?, default: false

      t.timestamps
    end
  end
end
