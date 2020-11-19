class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.belongs_to :account
      t.belongs_to :poll
      t.string :gmap_id, default: "", null: false

      t.timestamps
    end

    add_index :votes, [:account_id, :poll_id], unique: true    
  end
end
