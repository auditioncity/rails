class CreateDirectors < ActiveRecord::Migration
  def change
    create_table :directors do |t|
      t.integer :user_id, null: false
      t.string :company_name
      t.string :primary_address
      t.string :primary_email
      t.string :primary_phone
      t.string :primary_url

      t.timestamps null: false
    end
  end
end
