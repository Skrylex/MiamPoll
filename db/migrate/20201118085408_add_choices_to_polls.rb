class AddChoicesToPolls < ActiveRecord::Migration[6.1]
  def change
    change_table :polls do |t|
      t.text :choices, default: nil
    end
  end
end
