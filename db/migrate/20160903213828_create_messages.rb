class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :body
      t.boolean :from_user
      t.references :ping

      t.timestamps
    end
  end
end
