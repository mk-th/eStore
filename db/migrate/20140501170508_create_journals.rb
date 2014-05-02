class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.date :journal_date
      t.integer :account_id
      t.integer :journal_amount
      t.string :journal_entry_type
      t.text :journal_entry_description

      t.timestamps
    end
  end
end
