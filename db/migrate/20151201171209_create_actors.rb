class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.integer :user_id, null: false
      t.text :bio
      t.integer :age_young
      t.integer :age_old
      t.integer :height_feet
      t.integer :height_inches
      t.string :hair_color
      t.string :eye_color
      t.string :skills
      t.string :gender
      t.string :ethnicity
      t.string :talent_agency
      t.string :union

      t.timestamps null: false
    end
  end
end
