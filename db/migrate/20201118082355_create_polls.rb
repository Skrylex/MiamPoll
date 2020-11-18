class CreatePolls < ActiveRecord::Migration[6.1]
  def change
    create_table :polls do |t|
      t.string :title, default: ""
      t.text :description, default: ""
      t.belongs_to :account
      t.datetime :closed_at

      t.timestamps
    end
  end
end
