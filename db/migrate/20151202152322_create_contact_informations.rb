class CreateContactInformations < ActiveRecord::Migration
  def change
    create_table :contact_informations do |t|
      t.string :contactable_type
      t.integer :contactable_id
      t.string :type
      t.string :label
      t.string :info

      t.timestamps null: false
    end
  end
end
