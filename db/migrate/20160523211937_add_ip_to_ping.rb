class AddIpToPing < ActiveRecord::Migration
  def change
    add_column :pings, :ip, :string
  end
end
