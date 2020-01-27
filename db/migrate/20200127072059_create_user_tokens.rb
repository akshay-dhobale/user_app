class CreateUserTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :user_tokens do |t|
    	t.string :token
    	t.datetime :revoke_at
    	t.references :user, foreign_key: true
    	t.boolean :status
      t.timestamps
    end
  end
end
