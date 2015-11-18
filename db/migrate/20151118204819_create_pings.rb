class CreatePings < ActiveRecord::Migration
  def change
    create_table :pings do |t|
      t.string :uuid
      t.timestamps null: false
    end
  end
end
