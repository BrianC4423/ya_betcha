class ChangeBooleanInBets < ActiveRecord::Migration
  def change
    change_table :bets do |t|
      t.rename :accepted?, :accepted
      t.rename :declined?, :declined
    end
  end
end
