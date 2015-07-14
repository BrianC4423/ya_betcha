class CreateWagers < ActiveRecord::Migration
  def change
    create_table :wagers do |t|
      t.string "name", null: false

      t.timestamps
    end
  end
end
