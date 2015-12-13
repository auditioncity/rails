class CreateDecisions < ActiveRecord::Migration
  def change
    create_table :decisions do |t|
      t.integer :actor_id, null: false
      t.integer :director_id, null: false
      t.text :notes
      t.boolean :callback

      t.timestamps null: false
    end
  end
end
