class CreateGoals < ActiveRecord::Migration[7.0]
  def change
    create_table :goals do |t|
      t.references :user, null: false, foreign_key: true
      t.references :wish, null: false, foreign_key: true
      t.date :target_date
      t.integer :target_days_per_week
      t.integer :target_hours_per_day
      t.boolean :achieved

      t.timestamps
    end
  end
end
