class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :account_name
      t.integer :account_number, :limit => 8
      t.string :account_email
      t.integer :account_balance
      t.integer :account_credit_count
      t.integer :account_debit_count
      t.text :account_details

      t.timestamps
    end
  end
end
