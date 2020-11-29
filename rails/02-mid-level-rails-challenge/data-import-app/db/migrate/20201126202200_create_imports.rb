class CreateImports < ActiveRecord::Migration[6.0]
  def change
    create_table :imports do |t|
      t.references :customer
      t.datetime :start_time
      t.datetime :end_time
      t.integer :duration
      t.string :status
      t.string :identifier
      t.timestamps
    end
  end
end
