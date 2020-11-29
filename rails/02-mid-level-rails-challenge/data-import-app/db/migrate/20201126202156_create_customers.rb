class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.references :partner
      t.string :name
      t.string :subdomain
      t.string :location
      t.timestamps
    end
  end
end
