class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :phone_number
      t.string :password_digest
      t.datetime :last_login
      t.integer :failed_tries

      t.timestamps
    end
  end
end
