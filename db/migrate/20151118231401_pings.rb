class Pings < ActiveRecord::Migration
  def change
      add_column :pings, :version, :string
  end
end
