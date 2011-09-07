class CreateThanks < ActiveRecord::Migration
  def change
    create_table :thanks do |t|
      t.integer :user_id
      t.string :what
      t.string :message
      t.datetime :date_at
      t.timestamps
    end
  end
end
