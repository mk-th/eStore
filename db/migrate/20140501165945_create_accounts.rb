class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :account_name
      t.integer :account_number, :limit => 8
      t.string :account_email
      t.text :account_details

      t.timestamps
    end
  end
end
