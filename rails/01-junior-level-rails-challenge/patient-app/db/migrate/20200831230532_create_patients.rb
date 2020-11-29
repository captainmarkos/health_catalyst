class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.date :date_of_birth
      t.string :given_name
      t.string :family_name
      t.string :phone_number
      t.string :sex
      t.string :external_id
      t.integer :customer_external_id

      t.timestamps
    end
  end
end
