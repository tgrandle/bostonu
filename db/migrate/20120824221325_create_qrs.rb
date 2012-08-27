class CreateQrs < ActiveRecord::Migration
  def change
    create_table :qrs do |t|
      t.text :data
      t.references :user

      t.timestamps
    end
    add_index :qrs, :user_id
  end
end
