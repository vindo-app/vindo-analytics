class CreatePingsProgramsAssociation < ActiveRecord::Migration
  def change
    create_table :pings_programs, id: false do |t|
        t.belongs_to :ping
        t.belongs_to :program
    end
  end
end
