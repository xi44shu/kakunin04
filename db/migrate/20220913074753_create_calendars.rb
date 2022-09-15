class CreateCalendars < ActiveRecord::Migration[6.0]
  def change
    create_table :calendars do |t|
      t.date :scheduled_date,        null: false
      t.integer :time_zone_id,       null: false
      t.references :team,            null: false, foreign_key: true
      t.references :user,            null: false, foreign_key: true
      t.integer :size_id,       null: false
      t.string :start_time
      t.string :trading_company
      t.string :public_utility
      t.string :prime_contractor
      t.string :detail
      t.string :sales_staff
      t.timestamps
    end
  end
end
