class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :telephone_number,    default: "",  null: false
      t.string :postal_code,         default: "",  null: false
      t.integer :area,               null: false
      t.string :city,                default: ""
      t.string :house_number,        default: ""
      t.string :building_name,       default: ""
      t.references :order,           null: false,  foreign_key: true
      t.timestamps
    end
  end
end
