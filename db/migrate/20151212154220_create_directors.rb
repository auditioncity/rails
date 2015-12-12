class CreateDirectors < ActiveRecord::Migration
  def change
    create_table :directors do |t|
      t.integer :user_id, null: false
      t.string :company_name

      t.timestamps null: false
    end
  end
end
